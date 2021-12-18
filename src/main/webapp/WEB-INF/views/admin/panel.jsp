<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1 class="h1 mb-0 text-gray-800">Welcome Admin: ${user.username}!</h1><br>
    <div>
        <img src="${user.img}" alt="" height="150" width="150">
    </div>
</div>
<br>
<br>
<%--Events--%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Events</h5>
</div>
<div class="row m-2">
    <a href='<c:url value="/event/add"/>'
       class="d-none d-inline-block btn btn-sm btn-success btn-block shadow-sm"><i
            class="fas btn-link fa-sm text-white-50"></i>Add</a>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Name</th>
                            <th>City</th>
                            <th>Date</th>
                            <th>Place</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${events}" var="e">
                            <tr>
                                <td>${e.name}</td>
                                <td>${e.city}</td>
                                <td>${e.date}</td>
                                <td>${e.place}</td>
                                <td>
                                        <%--                               Update button--%>
                                    <div class="row m-2">
                                        <a href='<c:url value="/event/${e.id}/update"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-dark btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Update</a>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<%--FIGHTERS--%>
<br>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Fighters</h5>

</div>
<div class="row m-2">
    <a href='<c:url value="/fighter/add"/>'
       class="d-none d-inline-block btn btn-sm btn-success btn-block shadow-sm"><i
            class="fas btn-link fa-sm text-white-50"></i>Add</a>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">

            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Record</th>
                            <th></th>
                        </tr>

                        <c:forEach items="${fighters}" var="f">
                            <tr>
                                <td>${f.firstName}</td>
                                <td>${f.lastName}</td>
                                <td>${f.record}</td>
                                <td>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fighter/${f.id}/details"/>'
                                           class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Details</a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fighter/${f.id}/update"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-dark btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Update</a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fighter/${f.id}/upload"/>'
                                           class="d-none d-inline-block btn btn-sm btn-success btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Upload IMG</a>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>

        </div>
    </div>
</div>
<br>
<%--Fights--%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Fights</h5>
</div>
<div class="row m-2">
    <a href='<c:url value="/fight/add"/>'
       class="d-none d-inline-block btn btn-sm btn-success btn-block shadow-sm"><i
            class="fas btn-link fa-sm text-white-50"></i>Add</a>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Fighters</th>
                            <th>Result</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${fights}" var="fight" varStatus="theCount">
                            <tr>
                                <td>
                                    <c:forEach items="${fight.fighters}" var="fighter" varStatus="theCount">
                                        ${theCount.count}.${fighter.firstName}&nbsp;${fighter.lastName}<br>
                                    </c:forEach>
                                </td>
                                <td>${fight.result}</td>
                                <td>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fight/${fight.id}/comments"/>'
                                           class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i
                                                class="fas fa-user fa-sm text-white-50"></i>Read comments</a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fight/${fight.id}/video"/>'
                                           class="d-none d-inline-block btn btn-outline-danger  btn-block shadow-sm"><i
                                                class="text-white-50"></i>Watch on YouTube</a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/fight/${fight.id}/update"/>'
                                           class="d-none d-inline-block btn btn-outline-dark  btn-block shadow-sm"><i
                                                class="text-white-50"></i>Update</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Categories</h5>

</div>
<div class="row m-2">
    <a href='<c:url value="/category/add"/>'
       class="d-none d-inline-block btn btn-sm btn-success btn-block shadow-sm"><i
            class="fas btn-link fa-sm text-white-50"></i>Add</a>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">

            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Name</th>
                            <th></th>
                            <th></th>
                        </tr>

                        <c:forEach items="${categories}" var="c">
                            <tr>
                                <td>${c.name}</td>
                                <td></td>
                                <td><div class="row m-2">
                                    <a href='<c:url value="/category/${c.id}/update"/>'
                                       class="d-none d-inline-block btn btn-outline-dark  btn-block shadow-sm"><i
                                            class="text-white-50"></i>Update</a>
                                </div></td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>

        </div>
    </div>
</div>
<br>
<%--Users--%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Users</h5>

</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">

            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Name</th>
                            <th>Enabled</th>
                            <th>Role</th>
                            <th></th>
                        </tr>

                        <c:forEach items="${users}" var="u">
                            <tr>
                                <td>${u.username}</td>
                                <td>${u.enabled}</td>
                                <td>${u.role.name}</td>
                                <td>
                                    <div class="row m-2">
                                        <a href='<c:url value="/user/${u.id}/enabled"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-danger btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Block/Unblock</a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/user/${u.id}/role"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-dark btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Change role</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>

        </div>
    </div>
</div>
<br>


<%@ include file="/fragment/footer.jsp" %>