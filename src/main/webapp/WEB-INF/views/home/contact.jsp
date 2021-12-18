<%--
  Created by IntelliJ IDEA.
  User: kacper
  Date: 05.12.2021
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragment/header.jsp" %>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><a href="https://www.kswmma.com/">
        <img src="${pageContext.request.contextPath}/resources/img/unnamed.jpg" style="align-content: center">
    </a></h1>

</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Contact</h4>
    </div>
    <div class="card-body">
        EMAIL: BIURO@KSWMMA .COM<br>
        TEL./FAX: +48 22 629-26-26<br>
        ADRES: FEDERACJA KSW<br>
        UL. STĘPIŃSKA 39, 00-739 WARSZAWA
    </div>
</div>



<%@ include file="/fragment/footer.jsp" %>
