package mongodb.utils

import com.mongodb.MongoClient
import com.mongodb.MongoClientURI
import mongosyncer.MongoServer


class MongoConnection {

    private static MongoConnection instance

    static MongoConnection getInstance() { return (instance == null) ? new MongoConnection() : instance }

    /**
     * Returns a MongoClient with the config data from Client.
     *
     * @param client client.
     * @return MongoClient.
     */
    static MongoClient getConnection(MongoServer mongoServer) {
        String connection = ""
        try {
            if ((mongoServer.username == null || mongoServer.username.isEmpty()) &&
                    (mongoServer.username == null || mongoServer.password.isEmpty()) &&
                    (mongoServer.authDatabase == null || mongoServer.authDatabase.isEmpty())) {
                connection = "mongodb://" + mongoServer.host + ":" + mongoServer.port
            } else if ((mongoServer.username != null && !mongoServer.username.isEmpty()) &&
                    (mongoServer.username != null && !mongoServer.username.isEmpty()) &&
                    (mongoServer.authDatabase != null && !mongoServer.authDatabase.isEmpty())) {
                connection = "mongodb://" + mongoServer.username + ":" + mongoServer.password + "@" + mongoServer.host + ":" + mongoServer.port
            }

        } catch (Exception e) {
            e.printStackTrace()
        }
        return new MongoClient(new MongoClientURI(connection))
    }
}