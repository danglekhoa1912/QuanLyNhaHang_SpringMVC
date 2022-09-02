<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 9/2/2022
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="endpoint_service" value="/api/service"/>
<div class="container-fluid">
    <div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
    <div class="container">
        <div class="row">
            <div class="text-center col-md-7 mx-auto">
                <h2 id="service-title" style="padding: 20px;"><spring:message key="order.service"/></h2>
            </div>
        </div>
    </div>
    <hr class="mb-4"/>
    <div class="col-8 d-flex" id="order-services">

    </div>
</div>
<script src="<c:url value="/js/staff.js"/>"></script>
<script>
    window.onload = function () {
        loadService(`${endpoint_service}`);
    }
</script>
