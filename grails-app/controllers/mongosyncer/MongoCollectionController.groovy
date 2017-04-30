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
        Collection collection
        if (params.query || params.orderBy || params.order) {
            if (params.query == '' || params.query == null) {
                params.query = '{}'
            }
            collection = querys.getCollectionByQuery(mongo, mongoCollection.owner.name, mongoCollection.name,
                    params.query as String, params.orderBy as String, params.order as String)
            [mongoCollection: mongoCollection, collection: collection, query: params.query as String]
        } else {
            collection = querys.getFullCollection(mongo, mongoCollection.owner.name, mongoCollection.name)
            [mongoCollection: mongoCollection, collection: collection]
        }
    }

}
