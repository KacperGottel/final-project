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
    <h3 class="h3 mb-0 text-gray-600">${fighter.lastName} update</h3>
</div>

<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div>
                    <form:form method="post"
                               modelAttribute="fighter" class="row no-gutters align-items-center">
                        <form:hidden path="id"/>
                        <form:hidden path="img"/>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="firstName">FirstName</label>
                                <form:input name="firstName" path="firstName" type="text" class="form-control" id="firstName"
                                            placeholder="${fighter.firstName}"/>
                                <form:errors path="firstName"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="lastName">LastName</label>
                                <form:input name="lastName" path="lastName" type="text" class="form-control" id="lastName"
                                            placeholder="${fighter.lastName}"/>
                                <form:errors path="lastName"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="titles">Titles</label>
                                <form:input name="titles" path="titles" type="number"  min="0" step="1"  class="form-control" id="titles"
                                            placeholder="${fighter.titles}"/>
                                <form:errors path="titles"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="nationality">Nationality</label>
                                <form:input name="nationality" path="nationality" type="text"   class="form-control" id="nationality"
                                            placeholder="${fighter.nationality}"/>
                                <form:errors path="nationality"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="record">Record</label>
                                <form:input name="record" path="record" type="text" class="form-control" id="record" pattern="\\d*-\\d*-\\d*-\\d*"
                                            placeholder="${fighter.record}/(Format: WINS-LOSES-DRAWS-KOs)"/>
                                <form:errors path="record"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="birth">Birth</label>
                                <form:input name="birth" path="birth" type="date" class="form-control" id="birth"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="height">Height</label>
                                <form:input name="height" path="height" type="number" min="140" step="1" class="form-control" id="height"
                                            placeholder="${fighter.height}"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="weight">Weight</label>
                                <form:input name="weight" path="weight" type="number" min="40" step="5" class="form-control" id="weight"
                                            placeholder="${fighter.weight}"/>
                                <form:errors path="weight"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="clubName">ClubName</label>
                                <form:input name="clubName" path="clubName" type="text" class="form-control" id="clubName"
                                            placeholder="${fighter.clubName}"/>
                                <form:errors path="clubName"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="primaryStyle">Primary style</label>
                                <form:input name="primaryStyle" path="primaryStyle" type="text" class="form-control" id="primaryStyle"
                                            placeholder="${fighter.primaryStyle}"/>
                                <form:errors path="primaryStyle"/>
                            </div>
                        </div>
                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="category">Category</label>
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