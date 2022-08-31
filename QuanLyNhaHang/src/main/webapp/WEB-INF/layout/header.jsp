<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/08/2022
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/css/index.css"/>" type="text/css">
<nav class="navbar-expand-md navbar-dark bg-dark navbar fixed-top">
    <div class="container-fluid">
        <a class="nav-link text-light" href="<c:url value="/"/>"><b>The ADORA</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item mx-2">
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <a class="nav-link" href="<c:url value="/login"/>"><b><spring:message key="title.booking"/></b></a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <a class="nav-link" href="<c:url value="/order"/>"><b><spring:message key="title.booking"/></b></a>
                    </c:if>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#venue"><b><spring:message key="title.introduce"/></b></a>
                </li>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li class="nav-item mx-2">
                        <a href="<c:url value="/login" />" class="nav-link">
                            <i class="fa fa-user" aria-hidden="true"></i> <spring:message key="title.login"/>
                        </a>
                    </li>
                    <li class="nav-item mx-2">
                        <a href="<c:url value="/register" />" class="nav-link">
                            <i class="fa fa-check" aria-hidden="true"></i> <spring:message key="title.register"/>
                        </a>
                    </li>
                </c:if>
                <li class="nav-item mx-2">
                    <c:set var = "lang" scope = "session"><spring:message key="title.select.lang" /></c:set>
                    <c:choose>
                        <c:when test="${lang=='vi'}">
                            <a class="nav-link" href="?lang=en" ><spring:message key="title.lang.en"/></a>
                        </c:when>
                        <c:when test="${lang=='en'}">
                            <a class="nav-link" href="?lang=vi" ><spring:message key="title.lang.vi"/></a>
                        </c:when>
                    </c:choose>
                </li>
            </ul>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <ul class="navbar-nav">
                    <li>
                        <a class="nav-link" href="#">
                            <img src="${currentUser.avatar}" alt="Avatar Logo" style="width:30px;" class="rounded-pill">
                        </a>
                    </li>
                    <li class="nav-item dropdown nav-link ">
                        <a class="nav-link dropdown-toggle" href="#" role="button"
                           data-bs-toggle="dropdown">${pageContext.session.getAttribute("currentUser").name}</a>
                        <ul class="dropdown-menu-end dropdown-menu ">
                            <li>
                                <a class="dropdown-item" href="<c:url value="/profile" />">
                                    <spring:message key="title.infor" />
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<c:url value="/profile" />">
                                    <spring:message key="title.changePass" />
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<c:url value="/logout" />">
                                    <spring:message key="title.logout" />
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>
</nav>

