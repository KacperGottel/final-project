<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util" %>

<%--
  Created by IntelliJ IDEA.
  User: adam
  Date: 15/06/2021
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/fragment/header.jsp" %>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h2 class="h3 mb-0 text-gray-800">All Fighters to Add</h2>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Number</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Category</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${page.content}" var="f" varStatus="theCount">
                            <tr>
                                <td>${theCount.count}</td>
                                <td>${f.firstName}</td>
                                <td>${f.lastName}</td>
                                <td>${f.category.name}</td>
                                <td>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fighter/${f.id}/details"/>' class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i class="fas btn-group-toggle fa-sm text-white-50"></i>Details</a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/user/${user.id}/favouritefighters/${f.id}/add"/>' class="d-none d-inline-block btn btn-sm btn-success btn-block shadow-sm"><i class="fas btn-group-toggle fa-sm text-white-50"></i>Add</a>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <util:pagination thispage="${page}"></util:pagination>

                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/fragment/footer.jsp" %>