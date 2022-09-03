<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
</div>
<div class="container-fluid">

    <div class="row">
        <div class="d-flex">

        </div>
         <table class="table">
            <thead class="thead-light">
            <tr>
                <th>${title}</th>
                <th></th>
                <th><button type="button" class="btn-info" onclick="window.location.href=`?role=ROLE_STAFF`"> <spring:message key="admin.account.user"/></button></th>
                <th><button type="button" class="btn-info" onclick="window.location.href=`?role=ROLE_USER`"> <spring:message key="admin.account.cus"/></button></th>
                <th><div class="input-group">
                    <input type="search" id="search-box" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" onclick="search()" class="btn btn-outline-primary">search</button>
                </div></th>
            </tr>
            <tr>
                <th scope="col">Email</th>
                <th scope="col">Tên</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <c:forEach items="${listAccount}" var="a">
                <tr class="table-light">
                    <th scope="row">${a.email}</th>
                    <td>${a.name}</td>
                    <td>${a.mobile}</td>
                    <td>${a.birthday}</td>
                    <td><button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#imageModal" id="btn" onclick="viewDetail(`${a.name}`,`${a.birthday}`,`${a.mobile}`,`${a.email}`,`${a.avatar}`)"><spring:message key="admin.label.view"/></button></td>
                </tr>
            </c:forEach>
        </table>

    </div>
    <ul class="pagination d-flex justify-content-center" id="page">
        <c:forEach begin="1" end="${Math.ceil(accountCounter/pageSize)}" var="i">

            <c:url value="/admin/accountmanage" var="u">
                <c:param name="page" value="${i}"></c:param>
                <c:param name="role" value="${type}"></c:param>
            </c:url>
            <li class="page-item"><a class="page-link" href="${u}">${i}</a></li>
        </c:forEach>
    </ul>
</div>
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex justify-content-center" id="imageBox">
                <div class="col-2">
                    <img src="" id="img" class="card-img-top" alt="upload file here" />
                </div>
                <div class="col">
                    <div class="form-row">
                        <div class="col">
                            <label for="name"><spring:message key="admin.name"/></label>
                            <input type="text" id="name" class="form-control" disabled="true">
                        </div>
                        <div class="col">
                            <label for="birthday"><spring:message key="admin.birthday"/></label>
                            <input type="date" id="birthday" class="form-control" disabled="true">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="mobile"><spring:message key="admin.mobile"/></label>
                            <input type="text" id="mobile" class="form-control" disabled="true">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="email"><spring:message key="admin.email"/></label>
                            <input type="email" id="email" class="form-control" disabled="true">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><spring:message key="order.close"/></button>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/admin_account.js"/>"></script>

<script>
    function search() {
        window.location.href=`?role=${type}&name=`+document.getElementById("search-box").value;
    }
    function viewDetail(name, date,mobile,email,image){
        document.getElementById("name").value=name;
        document.getElementById("birthday").value=date;
        document.getElementById("mobile").value=mobile;
        document.getElementById("email").value=email;
        document.getElementById("img").src=image;
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