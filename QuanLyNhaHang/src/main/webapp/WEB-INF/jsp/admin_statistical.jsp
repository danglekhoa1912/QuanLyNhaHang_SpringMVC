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
<c:url var="end" value="/api/admin/listOrder"/>
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
                <th scope="col">Trạng thái</th>
                <th scope="col" ><spring:message key="button.order.update.status"/></th>
            </tr>
        </thead>
        <c:url value="/api/admin/order/update" var="endpoint" />
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
                <td><spring:message key="title.order.payment.status.${item.paymentStatus}" /></td>
                <td>
                    <c:choose>
                        <c:when test="${item.paymentStatus}">
                            <button onclick="updateStatus(`${endpoint}`,${item.id},!${item.paymentStatus})" id="btn-update-status-${item.id}" class="btn btn-danger"><spring:message key="button.order.update.status.${item.paymentStatus}" /></button>
                        </c:when>
                        <c:otherwise>
                            <button onclick="updateStatus(`${endpoint}`,${item.id},!${item.paymentStatus})" id="btn-update-status-${item.id}" class="btn btn-secondary"><spring:message key="button.order.update.status.${item.paymentStatus}" /></button>
                        </c:otherwise>
                    </c:choose>
                </td>
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
<div class="d-flex justify-content-center">
    <label for="month"><spring:message key="statis.label.time"/></label>
    <input class="datepicker" onchange="initMonth(`${end}`)" type="month" id="month" name="start" max="" value="2022-09">
</div>
<div class="container-fluid py-4">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-5 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3" >
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="mb-0 text-uppercase font-weight-bold"><spring:message key="statis.today.money"/><span id="month_statis"></span></p>
                                <h5 class="font-weight-bolder" id="total_price"> $53,000 </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-5 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-uppercase font-weight-bold"><spring:message key="statis.today.count"/><span id="month-statis"></span></p>
                                <h5 class="font-weight-bolder" id="total_order"> 2,300 </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                                <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    </div>
    <script src="<c:url value="/js/admin_statistical.js"/>"></script>
    <script>
        window.onload = function () {
            let date = new Date();
            let d = date.getMonth() + 1;
            initData(`${end}`, d, date.getFullYear());
            let s = date.getFullYear().toString() + "-" + d.toString();
            document.getElementById("month").max = s;
        }

    </script>
