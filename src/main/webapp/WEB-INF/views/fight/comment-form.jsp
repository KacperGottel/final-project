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
    <h3 class="h3 mb-0 text-gray-800">Fight</h3>
</div>
<h4 class="h4 mb-0 text-gray-800"><a href="/event/${fight.event.id}/fightcard">${fight.fighters.get(0).lastName}&nbsp;-&nbsp;${fight.fighters.get(1).lastName}</a>
</h4><br>
<br>

<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div>
                    <form:form method="post"
                               modelAttribute="comment" class="row no-gutters align-items-center">

                        <div class="col-xl-12 col-md-12 mb-2">
                            <div class="form-group">
                                <label for="content"></label>
                                <form:input name="content" path="content" type="text" class="form-control" id="content"
                                            placeholder="Write your comment..."/>
                                <form:errors path="content"/>
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