package mongodb

import com.mongodb.MongoClient
import com.mongodb.MongoCredential

class Querys {

    MongoCredential credentials

    def getAllDatabasesNames(MongoClient mongo) {
        mongo.listDatabaseNames()
    }

    def getAllCollectionsNamesFromDatabase(MongoClient mongo, String database) {
        mongo.getDatabase(database).listCollectionNames()
    }

}
