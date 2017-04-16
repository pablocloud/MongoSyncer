package mongosyncer

import grails.transaction.Transactional

class MongoServerController {

    @Transactional
    save(MongoServer mongoServer) {
        if(mongoServer.username == null){
            mongoServer.username = ''
        }
        if(mongoServer.password == null){
            mongoServer.password = ''
        }
        if(mongoServer.authDatabase == null){
            mongoServer.authDatabase = ''
        }
        mongoServer.save()
        redirect controller: 'main', action: 'index'
    }

    @Transactional
    update(MongoServer mongoServer) {
        mongoServer.save()
        redirect controller: 'main', action: 'index'
    }

    @Transactional
    delete(MongoServer mongoServer) {
        mongoServer.delete()
        redirect controller: 'main', action: 'index'
    }

}
