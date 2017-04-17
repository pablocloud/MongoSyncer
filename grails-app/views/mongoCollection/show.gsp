<%@ page import="org.bson.Document" %>
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
                ${mongoCollection.name}
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr>
                        <g:each in="${((Document) collection.first()).keySet()}">
                            <th>${it}</th>
                        </g:each>
                    </tr>
                    </thead>
                    <tbody>
                        <g:each in="${collection}">
                            <tr>
                                <g:each in="${((Document) it).values()}">
                                    <td>${it}</td>
                                </g:each>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>
</div>
</body>
</html>