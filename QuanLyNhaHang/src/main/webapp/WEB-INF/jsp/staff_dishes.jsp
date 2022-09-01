<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 9/1/2022
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
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
            <form class="col-5 ml-auto input-group">
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

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><spring:message key="order.close"/></button>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/staff.js"/>"></script>
<script>
    window.onload = function () {
        loadPage(`${endpoint}`, 1, 1, ${pageSize}, ${count_dish_1})
    }
</script>
<style>

</style>