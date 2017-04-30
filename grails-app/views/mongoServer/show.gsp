<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                ${mongoServer.host}:${mongoServer.port}
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <g:each in="${mongoServer.mongoDatabases}">
                        <g:link controller="mongoDatabase" action="show" id="${it.id}"
                                class="list-group-item">${it.name}<%--suppress HtmlUnknownTag --%>
                            <span class="badge">${it.collections.size()}</span></g:link>
                    </g:each>
                </ul>
            </div>
            <div class="panel-footer">
                <button class="btn btn-primary" data-toggle="modal" data-target="#server-update"><g:message code="mongoserver.updateServer"/></button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="server-update" tabindex="-1" role="dialog" aria-labelledby="server-update-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="server-update-label"><g:message code="other.update"/></h4>
            </div>
            <g:form controller="mongoServer" action="update" id="${mongoServer.id}">
                <div class="modal-body">
                    <div class="input-group">
                        <label for="host"><g:message code="mongoserver.host"/></label>
                        <input type="text" name="host" id="host" class="form-control" value="${mongoServer.host}"/>
                    </div>
                    <div class="input-group">
                        <label for="port"><g:message code="mongoserver.port"/></label>
                        <input type="number" name="port" id="port" class="form-control" value="${mongoServer.port}"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><g:message
                            code="shared.cancel"/></button>
                    <input type="submit" class="btn btn-primary" value="<g:message code="replica.update"/>">
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>