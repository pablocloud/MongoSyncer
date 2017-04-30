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
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <g:form controller="mongoCollection" action="show" id="${mongoCollection.id}">
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
                            <input type="submit" class="btn btn-info"/>
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

            </div>
        </div>
    </div>
</div>
</body>
</html>