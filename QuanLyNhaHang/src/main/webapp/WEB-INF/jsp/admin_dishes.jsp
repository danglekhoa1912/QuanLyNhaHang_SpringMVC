<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <c:url var="endpoint" value="/api"/>
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
            <c:url var="action" value="/admin/dishesmanage" />
            <form:form enctype="multipart/form-data" cssClass="d-block" method="post" modelAttribute="newDish" action="${action}" class="row">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body " id="imageBox">
                    <div class="col-4">
                        <img src="" id="imageDish" class="d-block card-img-top" alt="upload file here"/>
                        <form:input path="img" type="file" class="form-control-file" accept="image/png, image/gif, image/jpeg" id="imageUpload" style="padding: 5px;"/>
                    </div>
                    <div class="col-8">
                        <div class="form-row">
                            <form:input path="id" id="dishId" hidden="true" />
                            <div class="col">
                                <label for="nameDishes"><spring:message key="admin.dishes.name"/></label>
                                <form:input path="name" type="text" id="nameDishes" class="form-control" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col">
                                <label for="category"><spring:message key="admin.dishes.category"/></label>
                                <form:select path="categoryId" class="form-control" id="category" style="padding: 0px">
                                    <c:forEach items="${categoryDish}" var="cate">
                                        <option value="${cate.id}">${cate.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="col">
                                <label for="price"><spring:message key="admin.hall.price"/></label>
                                <form:input path="price" type="number" min="0"  id="price" class="form-control" />
                            </div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-secondary"><spring:message key="admin.save"/></button>
            </div>
            </form:form>
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