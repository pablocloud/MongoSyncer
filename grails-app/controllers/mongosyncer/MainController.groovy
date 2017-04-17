package mongosyncer

import mongodb.MongoModels

class MainController {

    MongoModels models = new MongoModels()

    def index() {
        List<MongoServer> mongoServers = MongoServer.listOrderById(params)
        mongoServers.each {
            it = models.populateMongoServer(it)
        }
        [replicas: MongoReplication.listOrderById(params), mongoServers: mongoServers]
    }

}
