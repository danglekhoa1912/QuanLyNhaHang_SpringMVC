<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/08/2022
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="<c:url value="/css/profile.css"/>" type="text/css">
<script src="<c:url value="/js/profile.js"/>"></script>
<c:url value="/profile" var="action"/>
<div class="container-xl px-4 mt-4">
    <!-- Account page navigation-->
    <%----%>
    <hr class="mt-0 mb-4">
    <div class="row" style="margin-top: 50px">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header"><spring:message key="profile.title.image"/></div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img class="img-account-profile rounded-circle mb-2" id="newImg" style="height: 10rem"
                         src="${currentUser.avatar}" alt="">
                    <!-- Profile picture upload button-->
                    <div class="form-group">
                        <label class="btn btn-secondary" for="imageId">
                            <spring:message key="profile.upload.image"/>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <div class="card mb-4">
                <div class="card-header">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#detail"><spring:message key="profile.title"/></a>
                        </li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#change-pass"><spring:message key="title.changePass"/></a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#list-order"><spring:message key="title.history.order"/></a></li>
                    </ul>
                </div>
                <div class="tab-content" id="myTabContent" >
                    <div class="card-body tab-pane fade show active" id="detail" >
                        <c:if test="${resultUpdate!=null}">
                            <c:choose>
                                <c:when test="${resultUpdate}">
                                    <div class="alert alert-success alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <spring:message key="title.update.success"/>
                                    </div>
                                </c:when>
                                <c:otherwise >
                                    <div class="alert alert-danger alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <spring:message key="title.update.fail"/>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                        <form:form method="post" enctype="multipart/form-data" modelAttribute="user" class="p-4 form"
                                   action="${action}"
                                   id="edit_user">
                            <div class="mb-3">
                                <label for="email"><b>Email</b></label>
                                <form:input value="${user.email}" class="form-control" path="email"
                                            type="text"
                                            name="email" id="email"/>
                                <form:errors path="email" cssClass=" text-danger" element="div"/>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label for="name"><b><spring:message key="title.name"/></b></label>
                                    <form:input value="${user.name}" class="form-control"
                                                path="name"
                                                type="text"
                                                name="name" id="name"/>
                                    <form:errors path="name" cssClass=" text-danger" element="div"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="birthday"><b><spring:message key="title.birthday"/></b></label>
                                    <form:input value="${user.birthday}" class="form-control"
                                                path="birthday"
                                                type="date" name="birthday" id="birthday"/>
                                    <form:errors path="birthday" cssClass=" text-danger" element="div"/>
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label for="mobile"><b><spring:message key="title.mobile"/></b></label>
                                    <form:input value="${user.mobile}" class="form-control"
                                                path="mobile"
                                                type="text" name="mobile" id="mobile"/>
                                    <form:errors path="mobile" cssClass=" text-danger" element="div"/>
                                </div>
                            </div>
                            <form:input hidden="true" type="file" path="img" name="imageId" id="imageId"/>
                            <form:input hidden="true" type="password" path="password" name="password" id="password"/>
                            <form:input hidden="true" type="password" path="confirmPassword" name="confirmPassword"
                                        id="confirmPassword"/>
                            <button type="submit" form="edit_user" value="Submit" class="btn btn-secondary"><spring:message
                                    key="profile.save"/></button>
                        </form:form>
                    </div>
                    <div class="card-body tab-pane fade" id="change-pass" >
                        <form>
                            <div class="mb-3" >
                                <label for="password"><b><spring:message key="title.pass" /></b></label>
                                <input class="form-control" type="password" id="password" >
                            </div>
                            <div class="mb-3" >
                                <label for="newPassword"><b><spring:message key="title.new.pass" /></b></label>
                                <input class="form-control" type="password" id="newPassword" >
                            </div>
                            <div class="mb-3" >
                                <label for="reNewPassword"><b><spring:message key="title.confirm.pass" /></b></label>
                                <input class="form-control" type="password" id="reNewPassword" >
                            </div>
                            <div class="mb-3" >
                                <button class="btn btn-secondary"><spring:message key="title.changePass" /></button>
                            </div>
                        </form>
                    </div>
                    <div class="card-body tab-pane fade" id="list-order" >

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

