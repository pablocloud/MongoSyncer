package mongosyncer

class MongoServer {

    String host
    int port
    String username
    String password
    String authDatabase

    static hasMany = [
            mongoDatabases: MongoDatabase
    ]

    static constraints = {
        mongoDatabases nullable: true
    }

    static mapping = {
        mongoDatabases lazy: false
        mongoDatabases sort: 'name', order: 'asc'
    }

}
