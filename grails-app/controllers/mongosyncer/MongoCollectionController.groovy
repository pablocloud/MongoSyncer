package mongosyncer

import com.mongodb.MongoClient
import mongodb.Querys
import mongodb.utils.MongoConnection
import org.bson.Document

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
            mongo.close()
            [mongoCollection: mongoCollection, collection: collection, query: params.query as String]
        } else {
            collection = querys.getFullCollection(mongo, mongoCollection.owner.name, mongoCollection.name)
            mongo.close()
            [mongoCollection: mongoCollection, collection: collection]
        }
    }

    def save(MongoCollection mongoCollection) {
        mongo = mongoConnection.getConnection(mongoCollection.owner.owner)
        Collection collection = querys.getFullCollection(mongo, mongoCollection.owner.name, mongoCollection.name)
        def set = collection.first().keySet()
        Document document = new Document()
        set.each {
            if (it != '_id') {
                document.put(it, params.get('json.' + it))
            }
        }
        mongo.getDatabase(mongoCollection.owner.name).getCollection(mongoCollection.name).insertOne(document)
        mongo.close()
        redirect controller: 'mongoCollection', action: 'show', id: mongoCollection.id
    }

}
