package mongosyncer

class MongoDatabase {

    String name

    static hasMany = [
            collections: MongoCollection
    ]

    static constraints = {

    }

    static mapping = {
        collections lazy: false
        collections sort: 'name', order: 'asc'
    }

}
