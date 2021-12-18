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
    <h1 class="h3 mb-0 text-gray-800"><a href="/event/${fight.event.id}/fightcard">${fight.fighters.get(0).lastName}&nbsp;-&nbsp;${fight.fighters.get(1).lastName}</a></h1>
    <a href="/fight/${fight.id}/comment/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i> Add Comment</a>
</div>


<br>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Number</th>
                            <th>Author</th>
                            <th>Content</th>
                            <th>Likes rate</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${comments}" var="com" varStatus="theCount">
                            <tr>
                                <td>${theCount.count}</td>
                                <td>${com.user.username}</td>
                                <td>${com.content}</td>
                                <td>${com.likes}</td>
                                <td>
                                    <div class="row m-2">
                                        <a href='<c:url value="/comment/${com.id}/like"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-primary btn-block shadow-sm"><i
                                                class="fas -thumbs-o-up fa-sm text-white-50"></i> LIKE </a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/comment/${com.id}/dislike"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-dark  btn-block shadow-sm"><i
                                                class="fas -thumbs-down fa-sm text-white-50"></i> DISLIKE </a>
                                    </div>
                                    <div class="row m-2">
                                        <a href='<c:url value="/comment/${com.id}/delete"/>'
                                           class="d-none d-inline-block btn btn-sm btn-outline-danger btn-block shadow-sm"><i
                                                class="fas -thumbs-down fa-sm text-white-50"></i> DELETE </a>
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

<%@ include file="/fragment/footer.jsp" %>