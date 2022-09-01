<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 9/2/2022
  Time: 1:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
    <div class="row">
        <div class="col-2"></div>
        <div class="input-group d-flex col-8" style="padding: 10px">
            <input type="search" class="form-control rounded" id="search" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
            <button type="button" class="btn btn-primary" onclick="searchHall()">search</button>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${weddingHall}" var="w">
            <div class="col-2"></div>
            <div class="card col-8">
                <img class="card-img-top" src="${w.image}" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">${w.name}</h5>
                    <p class="card-text">${w.describe}</p>
                    <p class="card-text">`<spring:message key="order.hall.capacity"/> ${w.capacity} <spring:message key="order.hall.price"/> ${w.price} 000 [VNĐ]`</p>
                </div>
            </div>
            <div class="col-2"></div>
        </c:forEach>
    </div>
</div>
<script>
    function searchHall(){
        let d=document.getElementById("search").value;
        window.location.href="?name="+d;
    }
</script>