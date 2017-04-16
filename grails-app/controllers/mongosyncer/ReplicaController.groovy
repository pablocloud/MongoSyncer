package mongosyncer

import grails.transaction.Transactional
import mongodb.MongoModels

class ReplicaController {

    MongoModels models = new MongoModels()

    def show(MongoReplication replica) {
        [replica: replica]
    }

    @Transactional
    changeAutoSync(MongoReplication replica){
        replica.autoSync = !replica.autoSync
        replica.save()
        redirect controller: 'replica', action: 'show', id: replica.id
    }

    @Transactional
    syncIteration(MongoReplication replica) {
        models.simpleSync(replica)
        redirect controller: 'replica', action: 'show', id: replica.id
    }

    @Transactional
    save(MongoReplication replica) {
        replica.save()
        redirect controller: 'main', action: 'index'
    }

    @Transactional
    update(MongoReplication replica) {
        replica.save()
        redirect controller: 'main', action: 'index'
    }

    @Transactional
    delete(MongoReplication replica) {
        replica.delete()
        redirect controller: 'main', action: 'index'
    }

}
