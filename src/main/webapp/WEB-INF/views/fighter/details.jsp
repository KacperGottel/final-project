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
    <h2 class="h3 mb-0 text-gray-800">${fighter.lastName} ${fighter.firstName}&nbsp;details</h2>
</div><br>
<div>
    <img src="${fighter.img}" alt="">
</div>
<br>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Category</th>
                            <th>Club</th>
                            <th>Titles</th>
                            <th>Nationality</th>
                            <th>Origin</th>
                            <th>Height</th>
                            <th>Weight</th>
                            <th>Birth</th>
                            <th>Record(W-D-L-K.O)</th>
                        </tr>
                        <tr>
                            <td>${fighter.firstName}</td>
                            <td>${fighter.lastName}</td>
                            <td><a href="/category/${fighter.category.id}/details">${fighter.category.name}</a></td>
                            <td>${fighter.clubName}</td>
                            <td>${fighter.titles}</td>
                            <td>${fighter.nationality}</td>
                            <td>${fighter.primaryStyle}</td>
                            <td>${fighter.height}</td>
                            <td>${fighter.weight}</td>
                            <td>${fighter.birth}</td>
                            <td>${fighter.record}</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<br>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h4 class="h4 mb-0 text-gray-600">Fights</h4>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <table class="table">

                        <th>
                            <th>Number</th>
                            <th>Fighters</th>
                            <th>Result</th>
                            <th>Event</th>
                            <th></th>
                        </tr>
                    <c:forEach items="${fights}" var="f" varStatus="theCount">
                        <tr>
                            <td>${theCount.count}</td>
                            <td>
                                <a href="/fighter/${f.fighters.get(0).id}/details"> ${f.fighters.get(0).lastName}</a> -
                                <a href="/fighter/${f.fighters.get(1).id}/details">${f.fighters.get(1).lastName}</a>
                            </td>
                            <td>${f.result}</td>
                            <td>${f.event.name}</td>
                            <td>
                                <div class="row m-2">
                                    <a href='<c:url value="/fight/${f.id}/video"/>'
                                       class="d-none d-inline-block btn btn-outline-danger btn-block shadow-sm"><i
                                            class="text-white-100"></i>Watch on YouTube</a>
                                </div>
                                <div class="row m-2">
                                    <a href='<c:url value="/fight/${f.id}/comments"/>'
                                       class="d-none d-inline-block btn btn-info btn-block shadow-sm"><i
                                            class="text-white-100"></i>Comments</a>
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