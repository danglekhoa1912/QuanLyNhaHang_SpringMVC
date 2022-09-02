<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: giahu
  Date: 9/2/2022
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="endpoint_service" value="/api/service"/>
<div class="container-fluid">
    <div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
    <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#serviceModal" onclick="initModalService()" >
        <spring:message key="admin.service.add"/>
    </button>
    <hr class="mb-4"/>

    <div class="col-8 d-flex" id="order-services">

    </div>
</div>
<div class="modal fade" id="serviceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-block" id="imageBox">
                <form class="row">
                    <div class="col-4">
                        <img src="" id="img" class="d-block card-img-top" alt="upload file here"/>
                        <input type="file" class="form-control-file" accept="image/png, image/gif, image/jpeg" id="imageUpload" style="padding: 5px;"/>
                    </div>
                    <div class="col-8">
                        <div class="form-row">
                            <div class="col">
                                <label for="nameService"><spring:message key="admin.service.name"/></label>
                                <input type="text" id="nameService" class="form-control" placeholder="<spring:message key="admin.service.typename"/>">
                            </div>
                            <div class="col">
                                <label for="price"><spring:message key="admin.hall.price"/></label>
                                <input type="number" min="0" step="10000" id="price" class="form-control" placeholder="<spring:message key="order.hall.price"/>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col">
                                <label for="describe"><spring:message key="admin.hall.describe"/></label>
                                <input type="text" id="describe" class="form-control" placeholder="<spring:message key="admin.hall.typedescribe"/>">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-flex">
                <button type="button" id="btn-delete" class="btn btn-danger" ><spring:message key="admin.delete"/> </button>
                <button type="button" class="btn btn-secondary"><spring:message key="admin.save"/></button>
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
    label{
        color: #16181b;
        font-weight: bold;
    }
</style>
<script src="<c:url value="/js/admin.js"/>"></script>
<script>
    window.onload = function () {
        loadService(`${endpoint_service}`);
    }
</script>
