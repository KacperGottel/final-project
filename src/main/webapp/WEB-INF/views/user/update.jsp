<%--
  Created by IntelliJ IDEA.
  User: kacper
  Date: 05.12.2021
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragment/header.jsp" %>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">
        Update ${user.username} <br>
        <div>
            <img src="${user.img}" style="align-content: center" width="200" height="200">
        </div>
    </h1>
</div>
<%--Form--%>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Image</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <form:form method="post"
                                       modelAttribute="user">
                            <form:hidden path="id"/>
                                <form:hidden path="img"/>
                            <td><form:input path="username" placeholder="${user.username}"
                                            class="card shadow h-100 py-2 text-gray-500"/><br>
                                <form:errors path="username"/></td>
                            <td>
                                <form:input path="password" placeholder="${user.password}"
                                            class="card  shadow h-100 py-2 text-gray-500"/><br>
                                <form:errors path="password"/></td>
                            <td><form:input path="email" placeholder="${user.email}"
                                            class="card  shadow h-100 py-2 text-gray-500"/>
                                <form:errors path="email"/></td>
                            <td><img src="${user.img}" alt="" width="100" height="100"></td>
                            <td>
                                <div class="row m-2">
                                    <input type="submit" value="Update"
                                           class="d-none d-inline-block btn btn-sm btn-outline-success btn-block shadow-sm">
                                </div>
                                </form:form>
                                <div class="row m-2">
                                    <a href='<c:url value="/user/${user.id}/upload"/>'
                                       class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i
                                            class="fas btn-link fa-sm text-white-50"></i>Upload image</a>
                                </div>
                            </td>

                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/fragment/footer.jsp" %>
