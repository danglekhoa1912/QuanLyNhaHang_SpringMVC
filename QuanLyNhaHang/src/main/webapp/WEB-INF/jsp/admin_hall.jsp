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
        <div class="input-group d-flex col-md-6" style="padding: 10px">
            <input type="search" class="form-control rounded col-8" id="search" placeholder="Search" aria-label="Search"
                   aria-describedby="search-addon"/>
            <button type="button" class="btn btn-primary" onclick="searchHall()"><spring:message key="admin.hall.search"/></button>
        </div>
        <div class=" col-md-2" style="padding: 10px">
            <button type="button" class="btn btn-primary" onclick="initModalEdit()" data-bs-toggle="modal"
                    data-bs-target="#hallModal"><spring:message key="admin.hall.add"/>
            </button>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${weddingHall}" var="w">
            <div class="col-md-3 col-xs-12 d-flex" style="padding: 10px;">
                <div class="card">
                    <img class="card-img-top" src="${w.image}" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${w.name}</h5>
                        <p class="card-text">${w.describe}</p>
                        <p class="card-text"><spring:message key="order.hall.capacity"/> ${w.capacity} <spring:message
                                key="order.hall.price"/> ${w.price} 000 [VNĐ]</p>
                    </div>
                    <div class="card-footer d-flex justify-content-center align-items-center">
                        <button type="button" data-bs-toggle="modal"
                                data-bs-target="#hallModal" onclick="editHall(`${w.name}`,`${w.describe}`,`${w.price}`,`${w.capacity}`)" class="btn btn-primary"><spring:message key="admin.hall.edit"/>
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="modal fade" id="hallModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal-title" style="color: #0a0c0c; font-weight: bold"></h5>
                <button type="button" class="btn-close" onclick="initModalEdit()" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex">
                <form>
                    <div class="form-row">
                        <div class="col">
                            <label for="nameHall" style="color: #16181b;font-weight: bold;"><spring:message key="admin.label.namehall"/></label>
                            <input type="text" id="nameHall" class="form-control" placeholder="<spring:message key="admin.hall.typehall"/>">
                        </div>
                        <div class="col">
                            <label for="priceHall" style="color: #16181b;font-weight: bold;"><spring:message key="admin.hall.price"/></label>
                            <input type="number" min="0" step="100" id="priceHall" class="form-control"
                                   placeholder="<spring:message key="admin.hall.inputprice"/>">
                        </div>
                        <div class="col">
                            <label for="capacityHall" style="color: #16181b;font-weight: bold;"><spring:message key="admin.hall.capacity"/></label>
                            <input type="number" id="capacityHall" class="form-control" placeholder="<spring:message key="admin.hall.typecapacity"/>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="describeHall" style="color: #16181b;font-weight: bold;margin-top:10px;"><spring:message key="admin.hall.describe"/></label>
                            <input type="text" id="describeHall" class="form-control" placeholder="<spring:message key="admin.hall.typedescribe"/>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="imageUpload" style="color: #16181b;font-weight: bold;margin-top:10px;"><spring:message key="admin.hall.image"/></label>
                            <input type="file" class="form-control" accept="image/png, image/gif, image/jpeg"
                                   id="imageUpload"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="deleteHall" class="btn btn-danger"><spring:message
                        key="admin.delete"/></button>
                <button type="button" class="btn btn-secondary"><spring:message
                        key="admin.save"/></button>
            </div>
        </div>
    </div>
</div>
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
</style>
<script src="<c:url value="/js/admin.js"/>"></script>

<script>
    function searchHall() {
        let d = document.getElementById("search").value;
        window.location.href = "?name=" + d;
    }
</script>