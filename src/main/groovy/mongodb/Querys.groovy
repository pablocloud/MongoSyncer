package mongodb

import com.mongodb.MongoClient
import com.mongodb.MongoCredential
import mongodb.utils.MongoConnection
import mongosyncer.MongoServer

class Querys {

    MongoClient mongo
    MongoCredential credentials

    MongoConnection mongoConnection = new MongoConnection()

    def getAllDatabasesNames(MongoServer mongoServer) {
        mongo = mongoConnection.getConnection(mongoServer)
        def names = mongo.listDatabaseNames()
        names
    }

    def getAllCollectionsNamesFromDatabase(MongoServer mongoServer, String database) {
        mongo = mongoConnection.getConnection(mongoServer)
        def names = new ArrayList()
        mongo.getDatabase(database).listCollectionNames().each {
            names.add(it)
        }
        names
    }

}
