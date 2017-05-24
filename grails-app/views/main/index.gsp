<%@ page import="mongosyncer.MongoReplication; mongosyncer.MongoServer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-body">
                <h3><g:message code="replica"/></h3>
                <button type="button" style="margin-bottom: 1%" class="btn btn-primary" data-toggle="modal"
                        data-target="#replica-add"><g:message
                        code="replica.add"/></button>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr>
                        <th><g:message code="replica.from"/></th>
                        <th><g:message code="replica.to"/></th>
                        <th><g:message code="replica.iterationSize"/></th>
                        <th><g:message code="replica.autoSync"/></th>
                        <th><g:message code="replica.actions"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${replicas}">
                        <tr>
                            <td>${it.from.host}:${it.from.port}</td>
                            <td>${it.to.host}:${it.to.port}</td>
                            <td>${it.iterationSize}</td>
                            <td>${it.autoSync}</td>
                            <td><g:link controller="replica" action="show" id="${it.id}" class="btn btn-info"><g:message
                                    code="replica.show"/></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <button type="button" style="margin-bottom: 1%" class="btn btn-primary" data-toggle="modal"
                        data-target="#server-add"><g:message
                        code="mongoserver.add"/></button>
                <h3><g:message code="mongoserver"/></h3>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr>
                        <th><g:message code="mongoserver.host"/></th>
                        <th><g:message code="mongoserver.port"/></th>
                        <th><g:message code="mongoserver.databases"/></th>
                        <th><g:message code="mongoserver.actions"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mongoServers}" var="server">
                        <tr>
                            <td>${server.host}</td>
                            <td>${server.port}</td>
                            <td><g:each in="${server.mongoDatabases}">${it.name}<br></g:each></td>
                            <td><g:link controller="mongoServer" action="show" id="${server.id}"
                                        class="btn btn-info"><g:message code="mongoserver.update"/></g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="replica-add" tabindex="-1" role="dialog" aria-labelledby="replica-add-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="replica-add-label"><g:message code="replica.add"/></h4>
            </div>
            <g:form controller="replica" action="update">
                <div class="modal-body">
                    <div class="input-group">
                        <label for="from"><g:message code="replica.from"/></label>
                        <select id="from" name="from" class="form-control">
                            <g:each in="${mongoServers}">
                                <option value="${it.id}">${it.host}:${it.port}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="to"><g:message code="replica.to"/></label>
                        <select id="to" name="to" class="form-control">
                            <g:each in="${mongoServers}">
                                <option value="${it.id}">${it.host}:${it.port}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="iterationSize"><g:message code="replica.iterationSize"/></label>
                        <input type="number" class="form-control" id="iterationSize" name="iterationSize"/>
                    </div>
                    <div class="input-group">
                        <label for="autoSync"><g:message code="replica.autoSync"/></label>
                        <f:input id="autoSync" bean="${new MongoReplication()}" property="autoSync"/>
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
<div class="modal fade" id="server-add" tabindex="-1" role="dialog" aria-labelledby="server-add-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="server-add-label"><g:message code="mongoserver.add"/></h4>
            </div>
            <g:form controller="mongoServer" action="save">
                <div class="modal-body">
                    <div class="input-group">
                        <label for="host"><g:message code="mongoserver.host"/></label>
                        <input type="text" class="form-control" name="host" id="host"/>
                    </div>
                    <div class="input-group">
                        <label for="port"><g:message code="mongoserver.port"/></label>
                        <input type="number" class="form-control" name="port" id="port"/>
                    </div>
                    <div class="input-group">
                        <label for="username"><g:message code="mongoserver.username"/></label>
                        <input type="text" class="form-control" name="username" id="username"/>
                    </div>
                    <div class="input-group">
                        <label for="password"><g:message code="mongoserver.password"/></label>
                        <input type="password" class="form-control" name="password" id="password"/>
                    </div>
                    <div class="input-group">
                        <label for="authDatabase"><g:message code="mongoserver.authDatabase"/></label>
                        <input type="text" class="form-control" name="authDatabase" id="authDatabase"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><g:message
                            code="shared.cancel"/></button>
                    <input type="submit" class="btn btn-primary" value="<g:message code="mongoserver.save"/>">
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>