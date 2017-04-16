package mongodb.loggers

import mongodb.interfaces.Logger

class ReplicaLogger implements Logger {

    /**
     * {@inheritDoc}
     */
    @Override
    void log(String message) {
        println message
    }

}
