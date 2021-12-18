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
    <h1 class="h1 mb-0 text-gray-800">Welcome ${user.username}!</h1><br>
    <div>
        <img src="${user.img}" alt="" height="150" width="150">
    </div>
</div>
<br>
<br>
<%--PERSONAL DETAILS--%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Personal details</h5>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Enabled</th>
                            <th>Role</th>
                            <th></th>
                        </tr>

                        <tr>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.enabled}</td>
                            <td>${user.role.name}</td>
                            <td>
                                <div class="row m-2">
                                    <a href='<c:url value="/user/${user.id}/update"/>'
                                       class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i
                                            class="fas btn-link fa-sm text-white-50"></i>Update</a>
                                </div>
                                <div class="row m-2">
                                    <a href='<c:url value="/user/${user.id}/upload"/>'
                                       class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i
                                            class="fas btn-link fa-sm text-white-50"></i>Upload Image</a>
                                </div>
                                <div class="row m-2">
                                    <a href='<c:url value="/user/${user.id}/confirm"/>'
                                       class="d-none d-inline-block btn btn-sm btn-danger btn-block shadow-sm"><i
                                            class="fas btn-link fa-sm text-white-50"></i>Delete</a>
                                </div>

                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<%--FAVOURITE FIGHTERS--%>
<br>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Favourite Fighters</h5>

</div>
<div class="row m-2">
    <a href='<c:url value="/user/${user.id}/favouritefighters/list"/>'
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
                            <th>No.</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Record</th>
                            <th></th>
                        </tr>

                        <c:forEach items="${user.favouriteFighters}" var="f" varStatus="theCount">
                        <tr>
                            <td>${theCount.count}</td>
                            <td>${f.firstName}</td>
                            <td>${f.lastName}</td>
                            <td>${f.record}</td>
                            <td>
                                <div class="row m-2">
                                    <a href='<c:url value="/fighter/${f.id}/details"/>'
                                       class="d-none d-inline-block btn btn-sm btn-info btn-block shadow-sm"><i
                                            class="fas btn-link fa-sm text-white-50"></i>Details</a>
                                </div>

                                <div class="row m-2 ">
                                    <button data-target="#confirm${user.id}${f.id}" data-toggle="modal" aria-pressed="true"
                                            href='<c:url value="/user/${user.id}/favouritefighters/${f.id}/delete"/>'
                                            class="d-none d-inline-block btn btn-sm btn-danger btn-block shadow-sm ">

                                        <i class="fas btn-link fa-sm text-white-50"></i>
                                        Delete
                                    </button>
                                </div>


                                <!-- Modal -->
                                <div class="modal fade" id="confirm${user.id}${f.id}" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel${user.id}${f.id}" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Do You want to remove <strong>${f.lastName}</strong> from Favourities?

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close
                                                </button>
                                                <a type="button" aria-pressed="true"
                                                        class="btn btn-primary btn-ok" href='<c:url value="/user/${user.id}/favouritefighters/${f.id}/delete"/>'>
                                                    Delete
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <%--modal end--%>
                                </c:forEach>


                            </td>
                        </tr>

                    </table>

                </div>
            </div>

        </div>
    </div>
</div>
<br>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Your comments</h5>
</div>
<%--ALL COMMENTS--%>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">


                    <table class="table">
                        <tr>
                            <th>No.</th>
                            <th>Content</th>
                            <th>Likes</th>
                            <th>Fight</th>
                            <th></th>
                        </tr>

                        <c:forEach items="${usercomments}" var="c" varStatus="theCount">
                            <tr>
                                <td>${theCount.count}</td>
                                <td>${c.content}</td>
                                <td>${c.likes}</td>
                                <td>
                                    <a href='<c:url value="/fight/${c.fight.id}/comments"/>'>${c.fight.fighters.get(0).lastName}-${c.fight.fighters.get(1).lastName}</a>
                                </td>
                                <td>

                                    <div class="row m-2">
                                        <a href='<c:url value="/user/comment/${c.id}/delete"/>'
                                           class="d-none d-inline-block btn btn-sm btn-danger btn-block shadow-sm"><i
                                                class="fas btn-link fa-sm text-white-50"></i>Delete</a>
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
<%--WYKRES--%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h5 class="h5 mb-0 text-gray-500">Stats</h5>
</div>
<div class="row">

    <!-- Content Column -->
    <div class="col-lg-6 mb-4">

        <!-- Project Card Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
            </div>
            <div class="card-body">
                <h4 class="small font-weight-bold">Server Migration <span
                        class="float-right">20%</span></h4>
                <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                         aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Sales Tracking <span
                        class="float-right">40%</span></h4>
                <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Customer Database <span
                        class="float-right">60%</span></h4>
                <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: 60%"
                         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Payout Details <span
                        class="float-right">80%</span></h4>
                <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                         aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Account Setup <span
                        class="float-right">Complete!</span></h4>
                <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/fragment/footer.jsp" %>