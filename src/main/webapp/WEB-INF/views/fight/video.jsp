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

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">${fight.fighters.get(0).lastName}-${fight.fighters.get(1).lastName}</h4>
    </div>
    <div class="card-body">
        ${fight.youtube}
    </div>
</div>



<%@ include file="/fragment/footer.jsp" %>
