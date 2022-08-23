<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 8/23/2022
  Time: 2:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/css/order.css"/>" type="text/css">
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="text-center col-md-7 mx-auto">
                <h2>ĐẶT TIỆC</h2>
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
                        <div class="col-md-6 mb-3"><label for="Name">Tên khách hàng</label>
                            <input type="text" style="font-weight: bold" class="form-control" id="Name" placeholder="" value="" required="">
                            <div class="invalid-feedback"> Valid first name is required.</div>
                        </div>
                        <div class="col-md-6 mb-3"><label for="mobile">Số điện thoại liên hệ</label>
                            <input type="mobile" style="font-weight: bold" class="form-control" id="mobile" placeholder="" value="" required="">
                            <div class="invalid-feedback"> Valid last name is required.</div>
                        </div>
                    </div>
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
                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <div class="py-1">
                            <div class="container">
                                <div class="row">
                                    <div class="text-center mx-auto col-md-12">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 p-3 d-flex">
                                        <div class="card bg-dark-opaque text-center">
                                            <div class="card-body p-4">
                                                <h4 contenteditable="true">Món khai vị</h4>
                                                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#exampleModal" >Thêm</button>
                                                <hr>
                                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                <c:forEach items="${dishes}" var="d">
                                                                    <c:if test="${d.categoryId.id==1}">
                                                                            <div class="col-lg-4 d-flex">
                                                                                <figure class="snip0019">
                                                                                    <img src="${d.imgae}" alt="dish"/>
                                                                                    <figcaption>
                                                                                        <div><h2>${d.name}</h2></div>
                                                                                        <div><p>${d.price},000 VNĐ</p></div>
                                                                                        <a class="choseDish" href="#"></a>
                                                                                    </figcaption>
                                                                                </figure>
                                                                            </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="button" class="btn btn-primary">Save changes</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <ul class="list-unstyled my-3">
                                                    <li class="mb-1">One</li>
                                                    <li class="mb-1">Two</li>
                                                    <li class="mb-1">Three</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 p-3 d-flex">
                                        <div class="card bg-dark-opaque text-center">
                                            <div class="card-body p-4">
                                                <h4> Món chính</h4>
                                                <a class="btn btn-primary" href="#">Thêm</a>
                                                <hr>
                                                <ul class="list-unstyled my-3">
                                                    <li class="mb-1">Gà xào sả ớt</li>
                                                    <li class="mb-1">cái gì đó</li>
                                                    <li class="mb-1">Six</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 p-3 d-flex">
                                        <div class="card bg-dark-opaque text-center">
                                            <div class="card-body p-4">
                                                <h4>Tráng miệng</h4>
                                                <a class="btn btn-primary" href="#">Thêm</a>
                                                <hr>
                                                <ul class="list-unstyled my-3">
                                                    <li class="mb-1">Seven</li>
                                                    <li class="mb-1">Eight</li>
                                                    <li class="mb-1">Nine</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 p-3 d-flex">
                                        <div class="card bg-dark-opaque text-center">
                                            <div class="card-body p-4">
                                                <h3> Đồ uống </h3> <a class="btn btn-primary" href="#"> Thêm</a>
                                                <hr>
                                                <ul class="list-unstyled my-3">
                                                    <li class="mb-1">Ten</li>
                                                    <li class="mb-1">Eleven</li>
                                                    <li class="mb-1">Twelve</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<div class="py-5 text-muted text-center">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-12 my-4">--%>
<%--                <p class="mb-1">© 2017-2018 Company Name</p>--%>
<%--                <ul class="list-inline">--%>
<%--                    <li class="list-inline-item">--%>
<%--                        <a href="#">Privacy</a>--%>
<%--                    </li>--%>
<%--                    <li class="list-inline-item">--%>
<%--                        <a href="#">Terms</a>--%>
<%--                    </li>--%>
<%--                    <li class="list-inline-item">--%>
<%--                        <a href="#">Support</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
<style>
    input, select{
        color: #0d0d0d;
        font-weight: bold;
    }
    option{
        font-weight: bold;
    }
</style>
<script >// item selection
$(function() {

    $("img").click(function() {
        $(this).toggleClass("hover");
    });

    $("#choseDish").click(function() {
        var imgs = $("img.hover").length;
        alert('there are ' + imgs + ' images selected');
    });

});
</script>

