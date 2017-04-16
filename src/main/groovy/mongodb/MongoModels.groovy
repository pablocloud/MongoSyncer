package mongodb

import com.mongodb.BasicDBObject
import com.mongodb.MongoClient
import com.mongodb.client.FindIterable
import mongodb.utils.MongoConnection
import mongosyncer.MongoCollection
import mongosyncer.MongoDatabase
import mongosyncer.MongoReplication
import mongosyncer.MongoServer
import org.bson.Document
import com.mongodb.client.MongoDatabase as MongoDatabaseNative
import com.mongodb.client.MongoCollection as MongoCollectionNative
import org.bson.types.ObjectId

class MongoModels {

    MongoConnection mongoConnection = new MongoConnection()
    Querys querys = new Querys()

    def populateMongoServer(MongoServer mongoServer) {
        def databaseNames = querys.getAllDatabasesNames(mongoServer)
        databaseNames.each { database ->
            MongoDatabase currentDatabase
            if (mongoServer.mongoDatabases == null) {
                mongoServer.mongoDatabases = []
            }
            if (!mongoServer.mongoDatabases.name.contains(database)) {
                currentDatabase = new MongoDatabase(name: database)
                mongoServer.mongoDatabases.add(currentDatabase)
                currentDatabase.save()
            } else {
                currentDatabase = MongoDatabase.findByName(database)
            }
            if (currentDatabase.collections == null) {
                currentDatabase.collections = []
            }
            querys.getAllCollectionsNamesFromDatabase(mongoServer, database).each { collection ->
                currentDatabase.each {
                    if (!it.collections.name.contains(collection)) {
                        currentDatabase.collections.add(new MongoCollection(name: collection))
                    }
                }

            }
        }
        return mongoServer
    }

    def simpleSync(MongoReplication replica) {
        MongoServer mongoFrom = replica.from
        MongoServer mongoTo = replica.to
        MongoClient clientFrom = mongoConnection.getConnection(mongoFrom)
        MongoClient clientTo = mongoConnection.getConnection(mongoTo)
        mongoFrom.mongoDatabases.each { database ->
            if (database.name != 'local' && database.name != 'admin') {
                MongoDatabaseNative databaseFrom = clientFrom.getDatabase(database.name)
                MongoDatabaseNative databaseTo = clientTo.getDatabase(database.name)
                database.collections.each { collection ->
                    MongoCollectionNative<Document> collectionFrom = databaseFrom.getCollection(collection.name)
                    MongoCollectionNative<Document> collectionTo = databaseTo.getCollection(collection.name)
                    long countTo = collectionTo.count()
                    if (countTo != 0) {
                        Document lastDocumentTo = collectionTo.find().sort(new BasicDBObject('_id', -1)).limit(1).first()
                        FindIterable<Document> limit = collectionFrom.find(new BasicDBObject("_id", new BasicDBObject('$gt', new ObjectId("" + lastDocumentTo.get('_id') + "")))).sort(new BasicDBObject("_id", 1)).limit(replica.iterationSize)
                        limit.each {
                            collectionTo.insertOne(it)
                        }
                    } else {
                        FindIterable<Document> limit = collectionFrom.find()
                        limit.each {
                            collectionTo.insertOne(it)
                        }
                    }
                }
                populateMongoServer(mongoFrom)
                populateMongoServer(mongoTo)
            }
        }
        clientTo.close()
        clientFrom.close()
    }

}
