package domain

import grails.test.mixin.TestFor
import mongosyncer.MongoServer
import spock.lang.Specification

@TestFor(MongoServer)
class MongoServerSpec extends Specification {

    def "find server by host"() {
        setup:
        mockDomain(MongoServer)

        when:
        new MongoServer(
                host: host,
                port: port,
                username: 'username',
                password: 'password',
                authDatabase: 'authDatabase'
        ).save()

        then:
        MongoServer.findByHost('127.0.0.1') != null

        where:
        host = '127.0.0.1'
        port = 27017
    }

}
