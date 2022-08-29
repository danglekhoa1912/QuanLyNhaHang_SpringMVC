<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/css/order.css"/>" type="text/css"/>
<c:url var="enpoint" value="/api/dishes" />
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="text-center col-md-7 mx-auto">
                <h2 style="padding: 20px;">Lên thực đơn</h2>
            </div>
        </div>
    </div>
    <div class="">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="d-flex justify-content-between mb-3"><span class="text-light"><b>Thực đơn</b></span>
                        <span id="total_dish" class="badge badge-primary badge-pill">0</span></h3>
                    <ul class="list-group" id="listDish" style="font-size: large;">
                        <li class="list-group-item d-flex justify-content-between" style="color: white; "><span>Total (VND)</span> <b id="total_price"></b></li>
                    </ul>
                    <a class="btn btn-light btn-block btn-lg" href="<c:url value="/services"/>">Continue</a>
                </div>
                <div class="col-md-8">
                    <div class="col-md-auto-3 d-flex justify-content-center">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-secondary active">
                                <input type="radio" name="options" id="option1"  onchange="loadPage(`${enpoint}`,1,1,${pageSize},${count_dish_1});" checked> Món khai
                                vị
                            </label>
                            <label class="btn btn-secondary">
                                <input type="radio" name="options" id="option2" onchange="loadPage(`${enpoint}`,2,1,${pageSize},${count_dish_2});"> Món chính
                            </label>
                            <label class="btn btn-secondary">
                                <input type="radio" name="options" id="option3" onchange="loadPage(`${enpoint}`,3,1,${pageSize},${count_dish_3});"> Món tráng miệng
                            </label>
                            <label class="btn btn-secondary">
                                <input type="radio" name="options" id="option4" onchange="loadPage(`${enpoint}`,4,1,${pageSize},${count_dish_4});"> Đồ uống
                            </label>
                        </div>
                    </div>
                    <div class="row" id="dish-total">
                    </div>
                    <div class="d-flex justify-content-center"  style="padding: 10px;">
                        <ul class="pagination" id="pagination">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/js/orderdish.js"/>"></script>

<script>
    window.onload=function (){
        loadPage(`${enpoint}`,1,1,${pageSize},${count_dish_1})
    }
</script>