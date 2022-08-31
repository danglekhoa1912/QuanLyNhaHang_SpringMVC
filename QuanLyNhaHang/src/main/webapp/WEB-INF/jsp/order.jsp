<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 8/23/2022
  Time: 2:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <form class="needs-validation" novalidate="" style="">
            <div class="row d-flex">
                <div class="col-md-3 mb-3"><label for="type_event"><spring:message key="order.book.type"/></label> <select
                        style="font-weight: bold"
                        class="custom-select d-block w-100" id="type_event" required="">
                    <option value=""><spring:message key="order.book.choose"/></option>
                    <option value="wedding"><spring:message key="order.book.wedding"/></option>
                    <option value="conference"><spring:message key="order.book.conference"/></option>
                    <option value="event"><spring:message key="order.book.event"/></option>
                </select>
                    <div class="invalid-feedback"><spring:message key="order.valid.choose"/></div>
                </div>
                <div class="col-md-3 mb-3"><label for="type_day"><spring:message key="order.book.time"/></label> <select
                        style="font-weight: bold"
                        class="custom-select d-block w-100" id="type_day" required="">
                    <option value=""><spring:message key="order.book.choose"/></option>
                    <option value="wedding"><spring:message key="order.type.day.1"/></option>
                    <option value="conference"><spring:message key="order.type.day.2"/></option>
                    <option value="event"><spring:message key="order.type.day.3"/></option>
                </select>
                </div>
                <div class="col-md-3 mb-3"><label for="timeOrder"><spring:message key="order.book.time"/></label>
                    <input type="time" class="form-control" style="font-weight: bold" id="timeOrder"
                           placeholder="" required="">
                    <div class="invalid-feedback"><spring:message key="order.valid.time"/></div>
                </div>
                <div class="col-md-3 mb-3"><label for="countTable"><spring:message key="order.book.count"/></label>
                    <input type="number" class="form-control" style="font-weight: bold" id="countTable"
                           placeholder="" required="">
                    <div class="invalid-feedback"><spring:message key="oder.valid.count"/></div>
                </div>
                <div class="mb-3"><label for="note"><spring:message key="order.book.note"/></label>
                    <input type="text" class="form-control" style="font-weight: bold" id="note" required="">
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
                            <ul class="list-group" id="listDish" style="font-size: large;">
                                <li class="list-group-item d-flex justify-content-between" style="color: white; "><span><spring:message key="order.book.total"/></span>
                                    <b id="total_price"></b></li>
                            </ul>
                            <a class="btn btn-light btn-block btn-lg" href="#service-title"><spring:message key="order.continue"/></a>
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
                                               onchange="loadPage(`${enpoint}`,2,1,${pageSize},${count_dish_2});"> <spring:message key="intro.dishes.main"/>
                                    </label>
                                    <label class="btn btn-secondary">
                                        <input type="radio" name="options" id="option3"
                                               onchange="loadPage(`${enpoint}`,3,1,${pageSize},${count_dish_3});"> <spring:message key="intro.dishes.dessert"/>
                                    </label>
                                    <label class="btn btn-secondary">
                                        <input type="radio" name="options" id="option4"
                                               onchange="loadPage(`${enpoint}`,4,1,${pageSize},${count_dish_4});"> <spring:message key="order.dish.drink"/>
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
            <a class="btn btn-primary btn-lg btn-block" href="<c:url value="#"/>"><spring:message key="order.continue"/></a>
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
                            <p class="card-text">`<spring:message key="order.hall.capacity"/> ${w.capacity} <spring:message key="order.hall.price"/> ${w.price} 000 [VNĐ]`</p>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                    onclick="weddingHall(`${w.name}`,`${w.describe}`,${w.capacity},${w.price},`${w.image}`);">
                                <spring:message key="order.choose.hall"/>
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><spring:message key="order.close"/></button>
            </div>
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
</style>
<script src="<c:url value="/js/orderdish.js"/>"></script>

<script>
    window.onload = function () {
        loadPage(`${enpoint}`, 1, 1, ${pageSize}, ${count_dish_1})
        loadService(`${endpoint_service}`);
    }
</script>


