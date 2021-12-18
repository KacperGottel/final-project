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
    <h3 class="h3 mb-0 text-gray-600">Fight Add</h3>
</div>

<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div>
                    <form:form method="post"
                               modelAttribute="fight" class="row no-gutters align-items-center">
                            <form:hidden path="id"/>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="event">Event</label>
                                <br>
                                <form:select path="event" items="${events}" itemLabel="name" itemValue="id"/>
                                <label></label>
                            </div>
                        </div>

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="fighters">Fighters</label>
                                <br>
                                <form:select path="fighters" items="${fighters}" itemLabel="lastName" itemValue="id" multiple="true"/>
                                <label></label>
                            </div>
                        </div>

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="result">result</label>
                                <form:input name="result" path="result" type="text" class="form-control" id="result"
                                            placeholder="${fight.result}"/>
                            </div>
                        </div>

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="youtube">YouTube</label>
                                <form:input name="youtube" path="youtube" type="text" placeholder="${fight.youtube}"
                                            class="form-control" id="youtube"/>
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