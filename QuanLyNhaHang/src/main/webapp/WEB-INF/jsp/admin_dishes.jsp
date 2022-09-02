<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
    <c:url var="endpoint" value="/api/dishes"/>
    <div class="col-2 mb-1"></div>
    <div class="col-8 mb-4 justify-content-center">
        <div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
            <label class="btn btn-secondary active">
                <input type="radio" name="options" id="option1"
                       onchange="loadPage(`${endpoint}`,1,1,${pageSize},${count_dish_1});"
                       checked> <spring:message key="intro.appetizer"/>
            </label>
            <label class="btn btn-secondary">
                <input type="radio" name="options" id="option2"
                       onchange="loadPage(`${endpoint}`,2,1,${pageSize},${count_dish_2});"> <spring:message
                    key="intro.dishes.main"/>
            </label>
            <label class="btn btn-secondary">
                <input type="radio" name="options" id="option3"
                       onchange="loadPage(`${endpoint}`,3,1,${pageSize},${count_dish_3});"> <spring:message
                    key="intro.dishes.dessert"/>
            </label>
            <label class="btn btn-secondary">
                <input type="radio" name="options" id="option4"
                       onchange="loadPage(`${endpoint}`,4,1,${pageSize},${count_dish_4});"> <spring:message
                    key="order.dish.drink"/>
            </label>
            <button type="button" class="btn btn-info" onclick="initEditDishes()" data-bs-toggle="modal"
                    data-bs-target="#imageModal"><spring:message key="admin.dishes.add"/>
            </button>
            <form class="col-5 ml-auto input-group" onsubmit="return false">
                <input type="search" class="form-control rounded" id="search" placeholder="Search" aria-label="Search" aria-describedby="search-addon" onchange="search_dish(`${endpoint}`, 1, 1, ${pageSize}, ${count_dish_1})" />
                <button type="button" class="btn btn-info" onclick="search_dish(`${endpoint}`, 1, 1, ${pageSize}, ${count_dish_1})">search</button>
            </form>
        </div>

        <table class="table" id="table_dishes">

        </table>
        <div class="d-flex justify-content-center">
            <ul class="pagination" id="pagination">

            </ul>
        </div>
    </div>
    <div class="col-2 mb-1"></div>

</div>
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-block" id="imageBox">
                <form class="row">
                    <div class="col-4">
                        <img src="" id="imageDish" class="d-block card-img-top" alt="upload file here"/>
                        <input type="file" class="form-control-file" accept="image/png, image/gif, image/jpeg" id="imageUpload" style="padding: 5px;"/>
                    </div>
                    <div class="col-8">
                        <div class="form-row">
                            <div class="col">
                                <label for="nameDishes"><spring:message key="admin.dishes.name"/></label>
                                <input type="text" id="nameDishes" class="form-control" placeholder="<spring:message key="admin.dishes.typeName"/>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col">
                                <label for="categoryDish"><spring:message key="admin.dishes.category"/></label>
                                <select class="form-control" id="categoryDish" style="padding: 0px">
                                    <option value="1"><spring:message key="intro.appetizer"/></option>
                                    <option value="2"><spring:message key="intro.dishes.main"/></option>
                                    <option value="3"><spring:message key="intro.dishes.dessert"/></option>
                                    <option value="4"><spring:message key="order.dish.drink"/> </option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="price"><spring:message key="admin.hall.price"/></label>
                                <input type="number" min="0" step="10000" id="price" class="form-control" placeholder="<spring:message key="order.hall.price"/>">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btn-delete" class="btn btn-danger" ><spring:message key="admin.delete"/> </button>
                <button type="button" class="btn btn-secondary"><spring:message key="admin.save"/></button>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/admin.js"/>"></script>
<script>
    window.onload = function () {
        loadPage(`${endpoint}`, 1, 1, ${pageSize}, ${count_dish_1})
    }
</script>
<style>
    .form-control {
        display: block;
        width: 100%;
        font-size: 0.875rem;
        font-weight: 400;
        line-height: 1;
        color: #69707a;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #c5ccd6;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: 0.35rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        font-weight: bold;
    }
    label{
        color: #16181b;
        font-weight: bold;
    }
</style>