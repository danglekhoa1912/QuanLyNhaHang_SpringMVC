<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 9/3/2022
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
    <div class="row py-1">
        <h3 class="d-flex justify-content-center"><spring:message key="order.list"/></h3>
    </div>
    <c:url var="endpoint" value="/api/menu"/>
    <c:url var="endpointservice" value="/api/orderService"/>
    <table class="table">
        <thead class="thead-light">
            <tr>
                <th scope="col"><spring:message key="admin.name"/></th>
                <th scope="col"><spring:message key="admin.hall"/></th>
                <th scope="col"><spring:message key="admin.time"/></th>
                <th scope="col"><spring:message key="admin.mobile"/></th>
                <th scope="col"><spring:message key="order.book.count"/></th>
                <th scope="col"><spring:message key="order.pay"/></th>
                <th scope="col"><spring:message key="order.price.service"/></th>
                <th scope="col"><spring:message key="order.price.dish"/></th>
            </tr>
        </thead>
        <c:forEach items="${listOrder}" var="item">
            <tr class="table-light">
                <th scope="row">${item.userId.name}</th>
                <td>${item.whId.name}</td>
                <td>${item.orderDate}</td>
                <td>${item.userId.mobile}</td>
                <td>${item.quantityTable}</td>
                <td>${item.typePay}</td>
                <td><button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#imageModal" onclick="viewListService(`${endpointservice}`,`${item.listServiceId.id}`)"><spring:message key="admin.label.view"/></button></td>
                <td><button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#imageModal" onclick="viewMenu(`${endpoint}`,`${item.menuId.id}`)"><spring:message key="admin.label.view"/></button></td>
            </tr>
        </c:forEach>
    </table>
    <ul class="pagination d-flex justify-content-center" id="page">
        <c:forEach begin="1" end="${Math.ceil(counter/pageSize)}" var="i">

            <c:url value="/admin/statistical" var="u">
                <c:param name="page" value="${i}"></c:param>
            </c:url>
            <li class="page-item"><a class="page-link" href="${u}">${i}</a></li>
        </c:forEach>
    </ul>
</div>
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex justify-content-center">
                <table class="table" id="modalBox">

                </table>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/admin_statistical.js"/>"></script>

