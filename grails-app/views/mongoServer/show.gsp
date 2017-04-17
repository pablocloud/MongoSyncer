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

            </div>
        </div>
    </div>
</div>
</body>
</html>