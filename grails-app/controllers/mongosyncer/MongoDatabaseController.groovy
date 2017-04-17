package mongosyncer

class MongoDatabaseController {

    def show(MongoDatabase mongoDatabase) {
        [mongoDatabase: mongoDatabase]
    }

}
