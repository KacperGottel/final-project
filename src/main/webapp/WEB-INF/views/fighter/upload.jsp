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
    Upload ${fighter.lastName} image <br>
    <div>
      <img src="${fighter.img}" style="align-content: center" height="200" width="200">
    </div>
  </h1>
</div>
<%--Form--%>
<div class="row">
  <div class="col-xl-12 col-md-12 mb-2">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">

          <form action="/fighter/${fighter.id}/upload" method="post" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="file" name="file" class="btn-secondary"/>
            <input type="submit" value="Upload" class="btn-outline-secondary"/>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>


<%@ include file="/fragment/footer.jsp" %>
