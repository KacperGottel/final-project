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
    <h1 class="h3 mb-0 text-gray-800">Fights News</h1>
</div>

<c:forEach items="${feed.messages}" var="m" varStatus="theCount">
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">${theCount.count}.${m.title}</h4>
    </div>
    <div class="card-body">
${m.description}
    </div>
    <button class="btn"><a href="${m.link}" target="_blank" rel="noopener noreferrer"><span class="text-gray-500">Read more</span></a></button>
</div>
</c:forEach>
<br>
<div>
    Copyright © &nbsp;${feed.copyright}
</div>


<%@ include file="/fragment/footer.jsp" %>
