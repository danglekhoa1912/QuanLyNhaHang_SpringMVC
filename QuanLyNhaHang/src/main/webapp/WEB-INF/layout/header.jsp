<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/08/2022
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- PAGE settings -->
    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<c:url value="/css/index.css"/>" type="text/css">
    <!-- Script: Make my navbar transparent when the document is scrolled to top -->
    <!-- Script: Animated entrance -->
<nav class="navbar-expand-md navbar-dark bg-dark navbar fixed-top">
    <div class="container">
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
            </ul>
            <a class="btn navbar-btn btn-secondary mx-2" href="<c:url value="/login"/>"><b>Đăng nhập/Đăng ký</b></a>
        </div>
    </div>
</nav>