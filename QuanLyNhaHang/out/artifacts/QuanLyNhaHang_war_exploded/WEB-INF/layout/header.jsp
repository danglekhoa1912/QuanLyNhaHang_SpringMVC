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
<div class="container">
    <nav class="navbar-expand-md navbar-dark bg-dark navbar fixed-top">

        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbar3SupportedContent" aria-controls="navbar3SupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse text-center d-flex justify-content-between" id="navbar3SupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item mx-3">
                    <a class="nav-link text-light" href="#"><b>The ADORA</b></a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="<c:url value="/order"/>"><b><spring:message key="title.booking"/></b></a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#venue"><b><spring:message key="title.introduce"/></b></a>
                </li>
                <%--                <sec:authorize access="!isAuthenticated()">--%>
                <%--                    <li class="nav-item">--%>
                <%--                        <a class="btn navbar-btn btn-secondary mx-2" href="<c:url value="/login" />"><spring:message key="title.login" /></a>--%>
                <%--                    </li>--%>
                <%--                    <li class="nav-item">--%>
                <%--                        <a class="btn navbar-btn btn-secondary mx-2" href="<c:url value="/register" />"><spring:message key="title.register" /></a>--%>
                <%--                    </li>--%>
                <%--                </sec:authorize>--%>
                <%--                <sec:authorize access="isAuthenticated()">--%>
                <%--                    <li class="nav-item">--%>
                <%--                        <div class="nav-link text-danger" >--%>
                <%--                                ${pageContext.session.getAttribute("currentUser").name}--%>
                <%--&lt;%&ndash;                            <sec:authentication property="principal.email" />&ndash;%&gt;--%>
                <%--                        </div>--%>
                <%--                    </li>--%>
                <%--                    <li class="nav-item">--%>
                <%--                        <a class="nav-link text-danger" href="<c:url value="/logout" />">Dang xuat</a>--%>
                <%--                    </li>--%>
                <%--                </sec:authorize>--%>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li class="nav-item">
                        <a href="<c:url value="/login" />" class="nav-link">
                            <i class="fa fa-user" aria-hidden="true"></i> <spring:message key="title.login"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value="/register" />" class="nav-link">
                            <i class="fa fa-check" aria-hidden="true"></i> <spring:message key="title.register"/>
                        </a>
                    </li>
                </c:if>
            </ul>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <div class="dropdown float-right ">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
                        <c:if test="${currentUser.avatar != null}">
                            <img style="width:30px;" src="${currentUser.avatar}" class="rounded-circle"/>
                        </c:if>
                        <c:if test="${currentUser.avatar == null}">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </c:if>
                            ${pageContext.session.getAttribute("currentUser").name}
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<c:url value="/logout" />" class="dropdown-item">
                                ????ng xu???t
                            </a>
                        </li>
                    </ul>

                </div>
            </c:if>
        </div>
    </nav>
</div>
