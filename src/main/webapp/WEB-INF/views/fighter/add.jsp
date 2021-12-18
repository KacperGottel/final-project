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
    <h3 class="h3 mb-0 text-gray-600">Fighter Add</h3>
</div>

<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div>
                    <form:form method="post"
                               modelAttribute="fighter" class="row no-gutters align-items-center">

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="firstName"></label>
                                <form:input name="firstName" path="firstName" type="text" class="form-control" id="firstName"
                                            placeholder="firstName"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="lastName"></label>
                                <form:input name="lastName" path="lastName" type="text" class="form-control" id="lastName"
                                            placeholder="lastName"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="titles"></label>
                                <form:input name="titles" path="titles" type="number"  min="0" step="1"  class="form-control" id="titles"
                                            placeholder="titles"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="nationality"></label>
                                <form:input name="nationality" path="nationality" type="text"   class="form-control" id="nationality"
                                            placeholder="nationality"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="record"></label>
                                <form:input path="record" type="text" class="form-control" id="record" pattern="\\d*-\\d*-\\d*-\\d*"
                                            placeholder="record (Format: WINS-LOSES-DRAWS-KOs)"/>
                                <form:errors path="record"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="birth"></label>
                                <form:input name="birth" path="birth" type="date" class="form-control" id="birth"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="height">Height</label>
                                <form:input name="height" path="height" type="number" min="140" step="1" class="form-control" id="height"
                                placeholder="height"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="weight">Weight</label>
                                <form:input name="weight" path="weight" type="number" min="40" step="5" class="form-control" id="weight"
                                            placeholder="weight"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="clubName"></label>
                                <form:input name="clubName" path="clubName" type="text" class="form-control" id="clubName"
                                            placeholder="clubName"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="primaryStyle"></label>
                                <form:input name="primaryStyle" path="primaryStyle" type="text" class="form-control" id="primaryStyle"
                                            placeholder="primaryStyle"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="category"></label>
                                <form:select path="category" items="${categories}" itemValue="id" itemLabel="name" class="form-control" id="category"/>
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