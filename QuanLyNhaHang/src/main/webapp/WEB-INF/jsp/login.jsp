<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 8/19/2022
  Time: 2:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="<c:url value="/js/animate-in.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/index.css"/>" type="text/css">

<div class="align-items-center d-flex photo-overlay py-5 cover"
     style="background-image: url(<c:url value="/assets/restaurant/cover_dark.jpg"/>);">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 align-self-center text-lg-left text-center">
                <h1 class="mb-0 mt-4 display-3">THE ADORA</h1>
                <p class="mb-5 lead">Đẳng cấp cho những điều quan trọng nhất</p>
            </div>
            <div class="col-lg-5 p-3">
                <u:url value="/login" var="action" />
                <form class="p-4 bg-dark-opaque" method="post" action="${action}">
                    <h4 class="mb-4 text-center">Đăng nhập</h4>
                    <c:if test="${param.error!=null}">
                        <div class="alert-danger alert" >
                            Da co loi xay ra ! vui long thu lai sau
                        </div>
                    </c:if>
                    <div class="form-group"><label for="email">Email</label>
                        <input id="email" name="email" class="form-control"></div>
                    <div class="form-group"><label for="password">Mật khẩu</label>
                        <input id="password" name="password" type="password" class="form-control"></div>
                    <div class="form-group"><a href="#" style="" class="text-warning">Chưa có tài khoản? Đăng ký tại
                        đây</a>
                    </div>
                    <input type="submit" value="Đăng nhập" class="btn mt-4 btn-block btn-outline-primary p-2">
                </form>
            </div>
        </div>
    </div>
</div>