<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <h3 class="h3 mb-0 text-gray-600">Event Add</h3>
</div>

<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div>
                    <form:form method="post"
                               modelAttribute="event" class="row no-gutters align-items-center">

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="city"></label>
                                <form:input name="city" path="city" type="text" class="form-control" id="city"
                                            placeholder="City"/>
                                <form:errors path="city"/>
                            </div>
                        </div>

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="name"></label>
                                <form:input name="name" path="name" type="text" class="form-control" id="name"
                                            placeholder="Name"/>
                                <form:errors path="name"/>
                            </div>
                        </div>

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="date"></label>
                                <form:input name="date" path="date" type="date"  class="form-control" id="date"/>
                                <form:errors path="date"/>
                            </div>
                        </div>

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="place"></label>
                                <form:input name="place" path="place" type="text" placeholder="Place name" class="form-control" id="place"/>
                                <form:errors path="place"/>
                            </div>
                        </div>


                        <div class="col-xl-12 col-md-12 mb-2">
                            <input type="submit" value="Add"
                                   class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-address-card fa-sm text-white-50"></i>

                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/fragment/footer.jsp" %>