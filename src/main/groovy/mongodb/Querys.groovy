package mongodb

import com.mongodb.MongoClient
import com.mongodb.MongoCredential
import mongosyncer.MongoServer

class Querys {

    MongoCredential credentials

    def getAllDatabasesNames(MongoClient mongo, MongoServer mongoServer) {
        mongo.listDatabaseNames()
    }

    def getAllCollectionsNamesFromDatabase(MongoClient mongo, MongoServer mongoServer, String database) {
        mongo.getDatabase(database).listCollectionNames()
    }

}
