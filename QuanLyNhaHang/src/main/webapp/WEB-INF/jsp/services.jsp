<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="/css/order.css"/>" type="text/css"/>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="text-center col-md-7 mx-auto">
                <h2>Book Party</h2>
            </div>
        </div>
    </div>
</div>
<div class="">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-push-3">
                <h4 class="d-flex justify-content-between mb-3"> <span class="text-muted"><b>Thực đơn</b></span> <span class="badge badge-secondary badge-pill">3</span> </h4>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between" >
                        <div>
                            <h6 class="my-0"><b>Product name</b></h6> <small class="text-muted">Brief description</small>
                        </div> <span class="text-muted">$12</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between"> <span>Total (USD)</span> <b>$20</b> </li>
                </ul>
            </div>
            <div class="col-md-8 col-md-push-6">
                <div class="">
                    <c:forEach begin="1" end="4" var="i">
                        <div class="row">
                            <c:forEach items="${allDishes}" var="d">
                                <c:if test="${d.categoryId.id==i}">
                                    <div class="col-lg-4 col-xs-12" style="padding: 5px">
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
                        <hr class="mb-4" >
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>