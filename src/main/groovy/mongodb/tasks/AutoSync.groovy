package mongodb.tasks

import mongodb.MongoModels
import mongosyncer.MongoReplication

class AutoSync extends Thread {

    MongoModels models = new MongoModels()

    @Override
    void run() {
        while (true) {
            List<MongoReplication> replicas
            MongoReplication.withTransaction {
                replicas = MongoReplication.listOrderById()
                replicas.each {
                    if (it.autoSync) {
                        println 'Autosyncing replica : ' + it.from.host + ':' + it.from.port + ' -> ' + it.to.host + ':' + it.to.port
                        models.simpleSync(it)
                    }
                }
            }
            sleep(5000)
        }
    }

}
