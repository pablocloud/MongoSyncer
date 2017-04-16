<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h1><g:message code="replica"/> ${replica.id} - <g:message code="replica.autosync"/> : ${replica.autoSync}</h1>
        <div class="panel panel-primary">
            <div class="panel-heading">
                ${replica.from.host}:${replica.from.port} -> ${replica.to.host}:${replica.to.port}
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        ${replica.from.host}:${replica.from.port} <g:message code="mongoServer.databases"/>
                        <ul>
                            <g:each in="${replica.from.mongoDatabases}">
                                <li>${it.name}</li>
                                <ol>
                                    <g:each in="${it.collections}">
                                        <li>${it.name}</li>
                                    </g:each>
                                </ol>
                            </g:each>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        ${replica.to.host}:${replica.to.port} <g:message code="mongoServer.databases"/>
                        <ul>
                            <g:each in="${replica.to.mongoDatabases}">
                                <li>${it.name}</li>
                                <ol>
                                    <g:each in="${it.collections}">
                                        <li>${it.name}</li>
                                    </g:each>
                                </ol>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <g:if test="${replica.autoSync}">
                    <button
                            class="btn btn-warning disabled" data-toggle="tooltip" data-placement="top"
                            title="Disabled if AutoSync is on"><g:message
                            code="replica.syncIteration"/></button>
                    <g:link controller="replica" action="changeAutoSync" id="${replica.id}"
                            class="btn btn-primary"><g:message
                            code="replica.changeAutosync"/></g:link>
                </g:if>
                <g:else>
                    <g:link controller="replica" action="syncIteration" id="${replica.id}"
                            class="btn btn-warning"><g:message
                            code="replica.syncIteration"/></g:link>
                    <g:link controller="replica" action="changeAutoSync" id="${replica.id}"
                            class="btn btn-primary"><g:message
                            code="replica.changeAutosync"/></g:link>
                </g:else>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>
</body>
</html>