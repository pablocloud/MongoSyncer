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
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#replica-update"><g:message
                        code="replica.update"/></button>
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
<div class="modal fade" id="replica-update" tabindex="-1" role="dialog" aria-labelledby="replica-update-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="replica-add-label"><g:message code="replica.add"/></h4>
            </div>
            <g:form controller="replica" action="update" id="${replica.id}">
                <div class="modal-body">
                    <div class="input-group">
                        <label for="iterationSize"><g:message code="replica.iterationSize"/></label>
                        <input type="number" class="form-control" id="iterationSize" name="iterationSize"
                               value="${replica.iterationSize}"/>
                    </div>
                    <div class="input-group">
                        <label for="autoSync"><g:message code="replica.autoSync"/></label>
                        <f:input bean="${replica}" property="autoSync"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><g:message
                            code="shared.cancel"/></button>
                    <input type="submit" class="btn btn-primary" value="<g:message code="replica.save"/>">
                </div>
            </g:form>
        </div>
    </div>
</div>
<g:if test="${replica.autoSync}">
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</g:if>
</body>
</html>