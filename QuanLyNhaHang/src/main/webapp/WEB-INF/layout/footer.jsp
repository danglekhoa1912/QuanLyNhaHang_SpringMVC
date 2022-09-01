<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/08/2022
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4 p-4">
                <h2 class="mb-4"><spring:message key="footer.contact"/></h2>
                <p class="m-0">
                    <a href="tel:+84 - 947 549 001" class="text-white"><spring:message key="footer.mobile"/></a></p>
                <p><spring:message key="footer.email"/></p>
            </div>
            <div class="col-md-4 p-4">
                <h2 class="mb-4"><spring:message key="footer.where"/></h2>
                <p><spring:message key="footer.map"/></p>
            </div>
            <div class="col-md-4 p-4">
                <h2 class="mb-4"><spring:message key="footer.social"/></h2>
                <p><spring:message key="footer.social.link"/></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mt-3">
                <p class="text-center text-muted"><spring:message key="footer.copyright"/></p>
            </div>
        </div>
    </div>
</div>
