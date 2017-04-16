package mongosyncer

import mongodb.tasks.AutoSync

class BootStrap {

    def init = { servletContext ->
        Thread.start {
            new AutoSync().run()
        }
    }
    def destroy = {

    }
}
