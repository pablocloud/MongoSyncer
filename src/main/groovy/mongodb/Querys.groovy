package mongodb

import com.mongodb.BasicDBObject
import com.mongodb.MongoClient
import com.mongodb.MongoCredential
import com.mongodb.client.FindIterable
import com.mongodb.client.MongoCollection
import org.bson.Document

class Querys {

    MongoCredential credentials

    def getAllDatabasesNames(MongoClient mongo) {
        mongo.listDatabaseNames()
    }

    def getAllCollectionsNamesFromDatabase(MongoClient mongo, String database) {
        mongo.getDatabase(database).listCollectionNames()
    }

    def getFullCollection(MongoClient mongo, String database, String collection) {
        MongoCollection<Document> mongoCollection = mongo.getDatabase(database).getCollection(collection)
        FindIterable<Document> find = mongoCollection.find()
        find.collect()
    }

    def getCollectionByQuery(MongoClient mongo, String database, String collection, String query, String orderBy, String order) {
        MongoCollection<Document> mongoCollection = mongo.getDatabase(database).getCollection(collection)
        FindIterable<Document> find = mongoCollection.find(BasicDBObject.parse(query)).sort(BasicDBObject.parse('{' + orderBy + ' : ' + order + '}'))
        if (find.size() != 0) {
            find.collect()
        }
    }

}
