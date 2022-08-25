<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/08/2022
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="<c:url value="/css/index.css"/>" type="text/css">
<div class="container">
<nav class="navbar-expand-md navbar-dark bg-dark navbar fixed-top">

        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar3SupportedContent" aria-controls="navbar3SupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse text-center justify-content-center" id="navbar3SupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item mx-3">
                    <a class="nav-link text-light" href="#"><b>The ADORA</b></a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#menu"><b>Dịch vụ</b></a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#venue"><b>Giới thiệu</b></a>
                </li>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="btn navbar-btn btn-secondary mx-2" href="<c:url value="/login" />">Dang nhap</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn navbar-btn btn-secondary mx-2" href="<c:url value="/register" />">Dang ky</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <div class="nav-link text-danger" >
                                ${pageContext.session.getAttribute("currentUser").name}
<%--                            <sec:authentication property="principal.email" />--%>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="<c:url value="/logout" />">Dang xuat</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
</nav>
</div>
