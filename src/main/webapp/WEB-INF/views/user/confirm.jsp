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
    <h1 class="h3 mb-0 text-gray-800">Confirm ${user.username} remove</h1>

</div>
<div>
    <h1 class="h6 mb-0 text-gray-800"><a href="/user/${user.id}/delete">YES</a></h1>
    <br>
    <h1 class="h6 mb-0 text-gray-800"><a href="/user/panel">NO</a></h1>
</div>


<%@ include file="/fragment/footer.jsp" %>
