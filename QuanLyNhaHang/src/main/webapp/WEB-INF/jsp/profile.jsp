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
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#feed-back"><spring:message key="title.feedback"/></a></li>
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
                        <form:form  method="post" modelAttribute="profileUser" class="p-4 form"
                                   action="${action}">
                            <form:input hidden="true" path="id" value="${profileUser.id}" id="userId" />
                            <div class="mb-3">
                                <label for="email"><b>Email</b></label>
                                <form:input readonly="true" value="${profileUser.email}" class="form-control" path="email"
                                            type="text"
                                            name="email" id="email"/>
                                <form:errors path="email" cssClass=" text-danger" element="div"/>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label for="name"><b><spring:message key="title.name"/></b></label>
                                    <form:input value="${profileUser.name}" class="form-control"
                                                path="name"
                                                type="text"
                                                name="name" id="name"/>
                                    <form:errors path="name" cssClass=" text-danger" element="div"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="birthday"><b><spring:message key="title.birthday"/></b></label>
                                    <form:input value="${profileUser.birthday}" class="form-control"
                                                path="birthday"
                                                type="date" name="birthday" id="birthday"/>
                                    <form:errors path="birthday" cssClass=" text-danger" element="div"/>
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label for="mobile"><b><spring:message key="title.mobile"/></b></label>
                                    <form:input value="${profileUser.mobile}" class="form-control"
                                                path="mobile"
                                                type="text" name="mobile" id="mobile"/>
                                    <form:errors path="mobile" cssClass=" text-danger" element="div"/>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-secondary" value="<spring:message
                                    key="profile.save"/>" />
                        </form:form >
                    </div>
                    <c:url value="/api/changepass" var="endpoint_change_pass" />
                    <div class="card-body tab-pane fade" id="change-pass" >
                        <form>
                            <div class="mb-3" >
                                <label for="newPassword"><b><spring:message key="title.new.pass" /></b></label>
                                <input  class="form-control" type="password" id="newPassword" />
                                <div id="error-pass" hidden class="text-danger" ><spring:message key="user.password.error.invalid" /></div>
                            </div>
                            <div class="mb-3" >
                                <label for="reNewPassword"><b><spring:message key="title.confirm.pass" /></b></label>
                                <input  class="form-control" type="password" id="reNewPassword" />
                                <div id="error-re-pass" hidden class="text-danger" ><spring:message key="user.confirmPassword.error.notequal" /></div>
                            </div>
                            <div class="mb-3" >
                                <button type="button" onclick="updatePass(`${endpoint_change_pass}`)" class="btn btn-secondary"><spring:message key="title.changePass" /></button>
                            </div>
                        </form>
                    </div>
                    <div class="card-body tab-pane fade text-light" id="list-order" >
                        <table class="table">
                            <thead>
                            <tr>
                                <th><spring:message key="title.order.id" /></th>
                                <th><spring:message key="title.order.date" /></th>
                                <th><spring:message key="title.order.typepay" /></th>
                                <th><spring:message key="title.order.total" /></th>
                                <th><spring:message key="title.order.payment.status" /></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listOrder}" var="order" >
                                <tr>
                                    <td>#${order.id}</td>
                                    <td>${order.orderDate}</td>
                                    <td>${order.typePay}</td>
                                    <td>${order.amount}</td>
                                    <td>
                                        <spring:message key="title.order.payment.status.${order.paymentStatus}" />
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <c:url value="/api/feedback" var="endpoint" />
                    <div class="card-body tab-pane fade text-light" id="feed-back" >
                        <div id="alert-feedback" class="alert alert-success d-none" role="alert">
                            <spring:message key="title.feedback.mess" />
                        </div>
                            <div class="mb-3 mt-3">
                                <textarea placeholder="<spring:message key="title.feedback.placehoder" />" class="form-control" rows="5" id="feedback" name="text"></textarea>
                            </div>
                            <button type="button" onclick="addComment(`${endpoint}`)" class="btn btn-primary"><spring:message key="title.feedback.send" /></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

