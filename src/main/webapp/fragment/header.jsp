<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: adam
  Date: 15/06/2021
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>KSW STATS</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="${pageContext.request.contextPath}/">
            <div class="sidebar-brand-text mx-3">KSW STATS</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <%--        <!-- Nav Item - Dashboard -->    PANEL BOCZNY--%>
        <li class="nav-item active">
            <a class="nav-link" href="/about">
                <i class="fas fa-fw fa-chevron-circle-right"></i>
                <span>KSW</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/event/list">
                <i class="fas fa-fw fa-chevron-circle-right"></i>
                <span>Events</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/fighter/list">
                <i class="fas fa-fw fa-chevron-circle-right"></i>
                <span>Fighters</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="https://kswshop.com/pl/">
                <i class="fas fa-fw fa-chevron-circle-right"></i>
                <span>KSW Shop</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/user/panel">
                <i class="fas fa-fw fa-chevron-circle-right"></i>
                <span>My Profile</span></a>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">


                    <!-- Nav Item - FooterLinks -->

                    <li class="nav-item dropdown no-arrow mx-1">

                        <div class="my-2"></div>
                        <a href="${pageContext.request.contextPath}/contact" class="btn btn-info btn-icon-split">
                            <span class="text">Contact</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown no-arrow mx-1">
                        <div class="my-2"></div>
                        <a href="${pageContext.request.contextPath}/api" class="btn btn-info btn-icon-split">
                            <span class="text">Free Api</span>
                        </a>
                    </li>


                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="authorities[0]"/>
                                </sec:authorize>
                            </span>
                            <img class="img-profile rounded-circle"
                                 src="${pageContext.request.contextPath}/resources/img/userlogo.png" alt="">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <%--   LOGOWANIE REJESTRACJA                         --%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/login">
                                <i class="fas fa-sign-in-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Sign in
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/register">
                                <i class="fas fa-registered fa-sm fa-fw mr-2 text-gray-400"></i>
                                Register
                            </a>
                            <div class="dropdown-divider"></div>
                            <sec:authorize access="isAuthenticated()">
                                <form action="<c:url value="/logout"/>" method="post" class="dropdown-item">

                                    <input type="submit" value="Logout" class="dropdown-item">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                            </sec:authorize>

                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">