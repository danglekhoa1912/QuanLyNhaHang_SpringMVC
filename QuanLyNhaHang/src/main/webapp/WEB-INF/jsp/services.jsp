<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/css/order.css"/>" type="text/css"/>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="text-center col-md-7 mx-auto">
                <h2>Book Party</h2>
            </div>
        </div>
    </div>
</div>
<div class="">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <h4 class="d-flex justify-content-between mb-3"><span class="text-muted"><b>Thực đơn</b></span> <span
                        class="badge badge-secondary badge-pill">3</span></h4>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between">
                        <div>
                            <h6 class="my-0"><b>Product name</b></h6> <small class="text-muted">Brief
                            description</small>
                        </div>
                        <span class="text-muted">$12</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between"><span>Total (USD)</span> <b>$20</b></li>
                </ul>
            </div>
            <div class="col-md-8">
                <div class="col-md-auto-3 d-flex justify-content-center">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                            <input type="radio" name="options" id="option1"  onchange="loadPage('/QuanLyNhaHang/api/dishes',1,1,${pageSize},35);" checked> Món khai
                            vị
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option2" onchange="loadPage('/QuanLyNhaHang/api/dishes',2,1,${pageSize},35);"> Món chính
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option3" onchange="loadPage('/QuanLyNhaHang/api/dishes',3,1,${pageSize},35);"> Món tráng miệng
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option4" onchange="loadPage('/QuanLyNhaHang/api/dishes',4,1,${pageSize},35);"> Đồ uống
                        </label>
                    </div>
                </div>
                <div class="row" id="dish-total">
                </div>
                <div class="d-flex justify-content-center"  style="padding: 10px;">
                    <ul class="pagination" id="pagination">
                        <%--<c:forEach begin="1" end="${Math.ceil(dishCount / pageSize)}" var="i">
                            <li class="page-item"><a class="page-link" href="${u}">${i}</a></li>
                        </c:forEach>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/orderdish.js"/>"></script>
<script>
    window.onload(loadPage('/QuanLyNhaHang/api/dishes',1,1,${pageSize},35))
</script>