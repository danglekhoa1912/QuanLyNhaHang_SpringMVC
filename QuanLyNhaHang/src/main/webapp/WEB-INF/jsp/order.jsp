<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 8/23/2022
  Time: 2:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://kit.fontawesome.com/84ef412b99.js" crossorigin="anonymous"></script>
<script src="<c:url value="/js/order.js"/>"></script>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="text-center col-md-7 mx-auto">
                <h2><spring:message key="order.book.party"/></h2>
            </div>
        </div>
    </div>
</div>
<div class="">
    <div class="container">
        <%--        <div class="row">--%>
        <%--            <div class="col-md-12 order-md-1">--%>
        <h4 class="mb-3"><b><spring:message key="order.book.info"/></b></h4>
        <form class="was-validated ">
            <div class="row d-flex">
                <div class="col-md-3 mb-3"><label for="date"><spring:message key="order.book.date"/></label>
                    <input required min="${now}" class="form-control" id="date" type="date"
                           onchange="checkStatusHall()">
                    <div class="text-danger" id="date-error" hidden><spring:message key="order.date.full"/></div>
                    <div class="invalid-feedback"><spring:message key="order.valid.date"/></div>
                </div>
                <div class="col-md-3 mb-3"><label for="type_day"><spring:message key="order.book.time"/></label> <select
                        style="font-weight: bold"
                        class="custom-select d-block w-100" id="type_day" required="">
                    <c:forEach items="${session}" var="s">
                        <option value="${s.id}">${s.session}</option>
                    </c:forEach>
                </select>
                    <div class="text-danger" id="session-error" hidden><spring:message
                            key="order.session.error"/></div>
                </div>
                <div class="col-md-3 mb-3"><label for="countTable"><spring:message key="order.book.count"/></label>
                    <input min="0" type="number" class="form-control" style="font-weight: bold" id="countTable"
                           required>
                    <div class="text-danger" id="table-error" hidden><spring:message
                            key="order.quantty.table.max"/></div>
                    <div class="invalid-feedback"><spring:message key="oder.valid.count"/></div>
                </div>
                <div class="mb-3"><label for="note"><spring:message key="order.book.note"/></label>
                    <input type="text" class="form-control" style="font-weight: bold" id="note">
                </div>
            </div>
        </form>
        <%--            </div>--%>
        <%--        </div>--%>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-lg-3 order-2 order-md-1 p-0"><img class="img-fluid d-block"
                                                                                   id="image-wd"
                                                                                   src="<c:url value="/assets/restaurant/chef_dark.jpg"/>">
                        </div>
                        <div class="d-flex flex-column justify-content-center p-3 col-md-8 offset-lg-1 align-items-start order-1 order-md-2"
                             id="wedding-hall">
                            <h3 id="hall-name"><spring:message key="order.hall.name"/></h3>
                            <p class="hall-describe"><spring:message key="order.hall.describe"/></p>
                            <button type=button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"><spring:message key="order.hall.addbtn"/>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:url var="enpoint" value="/api/dishes"/>
        <c:url var="endpoint_service" value="/api/service"/>
        <hr class="mb-4">
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="text-center col-md-7 mx-auto">
                        <h2 id="Main-menu" style="padding: 20px;"><spring:message key="order.menu.create"/></h2>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                            <h3 class="d-flex justify-content-between mb-3"><span
                                    class="text-light"><b><spring:message key="intro.menu"/></b></span>
                                <span id="total_dish" class="badge badge-primary badge-pill">0</span></h3>
                            <div class="card-header">
                                <span><spring:message key="order.book.total"/></span>
                                <b id="total_price"></b>
                            </div>
                            <c:forEach items="${categoryDish}" var="category">
                                <div class="card-body subheader">
                                        ${category.name}
                                    <ul class="list-group" id="listDish-${category.id}" style="font-size: large;">

                                    </ul>
                                </div>
                            </c:forEach>

                            <a class="btn btn-light btn-block btn-lg" href="#service-title"><spring:message
                                    key="order.continue"/></a>
                        </div>
                        <div class="col-md-8">
                            <div class="col-md-auto-3 d-flex justify-content-center">
                                <div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
                                    <label class="btn btn-secondary active">
                                        <input type="radio" name="options" id="option1"
                                               onchange="loadPage(`${enpoint}`,1,1,${pageSize},${count_dish_1});"
                                               checked> <spring:message key="intro.appetizer"/>
                                    </label>
                                    <label class="btn btn-secondary">
                                        <input type="radio" name="options" id="option2"
                                               onchange="loadPage(`${enpoint}`,2,1,${pageSize},${count_dish_2});">
                                        <spring:message key="intro.dishes.main"/>
                                    </label>
                                    <label class="btn btn-secondary">
                                        <input type="radio" name="options" id="option3"
                                               onchange="loadPage(`${enpoint}`,3,1,${pageSize},${count_dish_3});">
                                        <spring:message key="intro.dishes.dessert"/>
                                    </label>
                                    <label class="btn btn-secondary">
                                        <input type="radio" name="options" id="option4"
                                               onchange="loadPage(`${enpoint}`,4,1,${pageSize},${count_dish_4});">
                                        <spring:message key="order.dish.drink"/>
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
            <div class="container">
                <div class="row">
                    <div class="text-center col-md-7 mx-auto">
                        <h2 id="service-title" style="padding: 20px;"><spring:message key="order.choose.service"/></h2>
                    </div>
                </div>
            </div>
            <div class="row d-flex" id="order-services">

            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" onclick="createOrder()"><spring:message
                    key="order.continue"/></button>
        </div>
    </div>
</div>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><spring:message key="order.hall.title"/></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-block">
                <c:forEach items="${weddingHall}" var="w">
                    <div class="card">
                        <img class="card-img-top" src="${w.image}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${w.name}</h5>
                            <p class="card-text">${w.describe}</p>
                            <p class="card-text">`<spring:message key="order.hall.capacity"/> ${w.capacity}
                                <spring:message key="order.hall.price"/> ${w.price} 000 [VNĐ]`</p>
                            <c:if test="${w.status!=null}">
                                <p class="badge bg-danger"><spring:message key="weddinghall.status"/></p>
                            </c:if>
                            <c:if test="${w.status==null}">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        onclick="weddingHall(${w.id},`${w.name}`,`${w.describe}`,${w.capacity},${w.price},`${w.image}`);">
                                    <spring:message key="order.choose.hall"/>
                                </button>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><spring:message
                        key="order.close"/></button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-second" id="orderModal" tabindex="-2" role="dialog" aria-labelledby="orderModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color: #deebfd">
            <c:url value="/payment" var="action"/>
            <form id="form-payment" method="post" action="${action}" >
                <div class="modal-header">
                    <h1 class="form-header text-dark" data-component="header">
                        <spring:message key="header.order.detail"/>
                    </h1>
                </div>
                <div class="modal-body">

                    <div class="row ">
                        <div class="col">
                            <div class="form-group">
                                <label class="text-dark" for="email"><b>Email</b></label>
                                <input disabled id="email" type="text" class="form-control" value="${currentUser.email}"
                                       name="email">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label class="text-dark" for="name"><b><spring:message key="title.name"/></b></label>
                                <input disabled id="name" type="text" class="form-control" value="${currentUser.name}"
                                       name="name">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="text-dark" for="wedding-hall-name"><b><spring:message
                                        key="order.wedding.hall.type"/></b></label>
                                <input disabled id="wedding-hall-name" type="text" class="form-control"
                                       name="wedding-hall-name">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label class="text-dark" for="quantity-table"><b><spring:message
                                        key="order.book.count"/></b></label>
                                <input disabled id="quantity-table" type="number" class="form-control"
                                       name="quantity-table">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="text-dark" for="booking-date"><b><spring:message
                                key="order.book.date"/></b></label>
                        <input disabled id="booking-date" type="date" class="form-control"
                               name="booking-date">
                    </div>
                    <hr>
                    <div class="card">
                        <div class="row">
                            <div class="col justify-content-center">
                                <label class="text-dark" for="price-dish"><b><spring:message
                                        key="order.price.dish"/></b></label>
                            </div>
                            <div class="col">
                                <input disabled id="price-dish" type="number" class="form-control"
                                       name="price-dish">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col justify-content-center">
                                <label class="text-dark" for="price-service"><b><spring:message
                                        key="order.price.service"/></b></label>
                            </div>
                            <div class="col">
                                <input disabled id="price-service" type="number" class="form-control"
                                       name="price-service">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col justify-content-center">
                                <label class="text-dark" for="price-weddinghall"><b><spring:message
                                        key="order.price.wedding.hall"/></b></label>
                            </div>
                            <div class="col">
                                <input disabled id="price-weddinghall" type="number" class="form-control"
                                       name="price-weddinghall">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row ">
                        <div class="col center-block">
                            <label class="text-dark" for="price-total"><b><spring:message key="order.price.total"/></b></label>
                        </div>
                        <div class="col">
                            <input disabled id="price-total" type="number" class="form-control"
                                   name="price-total">
                        </div>
                    </div>
                    <hr>
                    <div class="form-group" style="background-color: #deebfd ">
                        <label class="text-dark" for="name"><b>Phương thức thanh toán</b></label>
                        <div class="form-check text-dark">
                            <input type="radio" class="form-check-input bg-success" id="cash" name="optradio"
                                   value="momo" checked>
                            <label class="form-check-label text-dark" for="cash">Tiền mặt</label>
                        </div>
                        <div class="form-check text-dark d-flex align-items-center">
                            <input type="radio" class="form-check-input bg-success " id="momo" name="optradio"
                                   value="momo">
                            <label class="form-check-label text-dark" for="momo">
                                <img src="<c:url value="/assets/momo.png" />" style="height: 40px" class="rounded"
                                     alt="Cinque Terre">
                            </label>
                        </div>
                        <div class="form-check text-dark d-flex align-items-center">
                            <input type="radio" class="form-check-input bg-success" id="momo-card" name="optradio"
                                   value="momo-card">
                            <label class="form-check-label text-dark" for="momo-card">
                                <img src="<c:url value="/assets/momo.png" />" style="height: 40px" class="rounded"
                                     alt="Cinque Terre">
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btn-payment" type="submit" class="btn btn-primary"><spring:message key="order.pay"/></button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><spring:message
                            key="order.close"/></button>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    input, select {
        color: #0d0d0d;
        font-weight: bold;
    }

    option {
        font-weight: bold;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    /* Firefox */
    input[type=number] {
        -moz-appearance: textfield;
    }
</style>
<script src="<c:url value="/js/orderdish.js"/>"></script>

<script>
    window.onload = function () {
        loadPage(`${enpoint}`, 1, 1, ${pageSize}, ${count_dish_1})
        loadService(`${endpoint_service}`);
    }


</script>


