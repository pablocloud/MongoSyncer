package mongodb

import com.mongodb.MongoClient
import com.mongodb.MongoCredential
import mongosyncer.MongoServer

class Querys {

    MongoCredential credentials

    def getAllDatabasesNames(MongoClient mongo, MongoServer mongoServer) {
        def names = mongo.listDatabaseNames()
        names
    }

    def getAllCollectionsNamesFromDatabase(MongoClient mongo, MongoServer mongoServer, String database) {
        def names = new ArrayList()
        mongo.getDatabase(database).listCollectionNames().each {
            names.add(it)
        }
        names
    }

}
