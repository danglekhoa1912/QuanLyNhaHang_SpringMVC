<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 8/23/2022
  Time: 2:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://kit.fontawesome.com/84ef412b99.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value="/css/order.css"/>" type="text/css">
<script src="<c:url value="/js/order.js"/>"></script>
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
    <div class="container">
        <div class="row">
            <div class="col-md-12 order-md-1">
                <h4 class="mb-3"><b>Thông tin đơn đặt</b></h4>
                <form class="needs-validation" novalidate="" style="">
                    <div class="row">
                        <div class="col-md-3 mb-3"><label for="country">Loại tiệc</label> <select style="font-weight: bold"
                                class="custom-select d-block w-100" id="country" required="">
                            <option value="">Chọn...</option>
                            <option value="wedding">Đám cưới</option>
                            <option value="conference">Hội nghị</option>
                            <option value="event">Sự kiện</option>
                        </select>
                            <div class="invalid-feedback"> Vui lòng chọn loại tiệc</div>
                        </div>
                        <div class="col-md-4 mb-3"><label for="time">Ngày đặt</label>
                            <input type="date" class="form-control" style="font-weight: bold" id="time" placeholder="" value="" required="">
                            <div class="invalid-feedback">Vui lòng chọn ngày đặt !.</div>
                        </div>
                        <div class="col-md-3 mb-3"><label for="timeOrder">Thời gian đặt</label>
                            <input type="time" class="form-control" style="font-weight: bold" id="timeOrder" placeholder="" required="">
                            <div class="invalid-feedback">Nhập thời gian đặt.</div>
                        </div>
                        <div class="col-md-2 mb-3"><label for="countTable">Số lượng bàn</label>
                            <input type="number" class="form-control" style="font-weight: bold" id="countTable" placeholder="" required="">
                            <div class="invalid-feedback"> Zip code required.</div>
                        </div>
                    </div>
                    <div class="mb-3"><label for="note">Ghi chú</label>
                        <input type="text" class="form-control" style="font-weight: bold" id="note" placeholder="1234 Main St" required="">
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-4 col-lg-3 order-2 order-md-1 p-0"><img class="img-fluid d-block" src="<c:url value="/assets/restaurant/chef_dark.jpg"/>">
                                    </div>
                                    <div class="d-flex flex-column justify-content-center p-3 col-md-8 offset-lg-1 align-items-start order-1 order-md-2">
                                        <h3 id="hall-name">Một chiếc sảnh thật lung linh</h3>
                                        <p class="hall-describe">Chúng tôi có đa dạng sự lựa chọn</p> <a class="btn btn-primary"
                                                                                                href="#">Khám phá
                                        nào</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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
                                <div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
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
                            <div class="d-flex justify-content-center">
                                <ul class="pagination" id="pagination">

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="mb-4">

            <a class="btn btn-primary btn-lg btn-block" href="<c:url value="/services"/>">Continue to checkout</a>
        </div>
    </div>
</div>
<style>
    input, select{
        color: #0d0d0d;
        font-weight: bold;
    }
    option{
        font-weight: bold;
    }
</style>
<script src="<c:url value="/js/orderdish.js"/>"></script>

<script>
    window.onload=function (){
        loadPage(`${enpoint}`,1,1,${pageSize},${count_dish_1})
    }
</script>


