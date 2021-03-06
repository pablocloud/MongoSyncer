<%@ page import="org.bson.Document" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<ol class="breadcrumb">
    <li><g:link controller="mongoServer" action="show"
                id="${mongoCollection.owner.owner.id}">${mongoCollection.owner.owner.host}:${mongoCollection.owner.owner.port}</g:link></li>
    <li><g:link controller="mongoDatabase" action="show"
                id="${mongoCollection.owner.id}">${mongoCollection.owner.name}</g:link></li>
    <li class="active">${mongoCollection.name}</li>
</ol>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                ${mongoCollection.name}
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <g:form controller="mongoCollection" action="show" id="${mongoCollection.id}">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label for="query"><g:message code="mongoCollection.query"/></label>
                                        <g:if test="${params.query}">
                                            <input type="text" name="query" id="query" class="form-control"
                                                   value="${params.query}"/>
                                        </g:if>
                                        <g:else>
                                            <input type="text" name="query" id="query" class="form-control" value="{}"/>
                                        </g:else>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="orderBy"><g:message code="mongoCollection.orderBy"/></label>
                                        <select name="orderBy" id="orderBy" class="form-control">
                                            <g:each in="${((Document) collection.first()).keySet()}">
                                                <g:if test="${params.orderBy == it}">
                                                    <option selected value="${it}">${it}</option>
                                                </g:if>
                                                <g:else>
                                                    <option value="${it}">${it}</option>
                                                </g:else>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="order"><g:message code="mongoCollection.order"/></label>
                                        <select name="order" id="order" class="form-control">
                                            <g:if test="${params.order == '-1'}">
                                                <option selected value="-1">asc</option>
                                            </g:if>
                                            <g:else>
                                                <option value="-1">asc</option>
                                            </g:else>
                                            <g:if test="${params.order == '1'}">
                                                <option selected value="1">desc</option>
                                            </g:if>
                                            <g:else>
                                                <option value="1">desc</option>
                                            </g:else>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-info"/>
                            <hr>
                        </g:form>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <g:if test="${collection != null && collection.size() != 0}">
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
                        </g:if>
                    </div>
                </div>
                <hr>
            </div>
            <div class="panel-footer">
                <button type="button" style="margin-bottom: 1%" class="btn btn-primary" data-toggle="modal"
                        data-target="#document-add"><g:message
                        code="document.add"/></button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="document-add" tabindex="-1" role="dialog" aria-labelledby="document-add-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <g:form controller="mongoCollection" action="save" id="${mongoCollection.id}">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="document-add-label"><g:message code="document.add"/></h4>
                </div>
                <div class="modal-body">
                    <g:each in="${((Document) collection.first()).keySet()}">
                        <g:if test="${it != '_id'}">
                            <label for="json.${it}">${it}</label>
                            <input class="form-control" type="text" id="json.${it}" name="json.${it}"/>
                        </g:if>
                    </g:each>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary">
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>