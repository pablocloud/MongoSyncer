package mongosyncer

import com.mongodb.MongoClient
import mongodb.Querys
import mongodb.utils.MongoConnection

class MongoCollectionController {

    MongoConnection mongoConnection = MongoConnection.getInstance()
    MongoClient mongo
    Querys querys = new Querys()

    def show(MongoCollection mongoCollection) {
        mongo = mongoConnection.getConnection(mongoCollection.owner.owner)
        Collection collection = querys.getFullCollection(mongo, mongoCollection.owner.name, mongoCollection.name)
        [mongoCollection: mongoCollection, collection: collection]
    }

}
