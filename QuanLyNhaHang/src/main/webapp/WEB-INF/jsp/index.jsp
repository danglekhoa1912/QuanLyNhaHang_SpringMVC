<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!-- PAGE settings -->
    <title>The Adora</title>
    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="<c:url value="/css/index.css"/>" type="text/css">

<!-- Cover -->
<div class="align-items-center d-flex photo-overlay py-5 cover"
     style="background-image: url(<c:url value="/assets/restaurant/cover_dark.jpg"/>);">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 align-self-center text-lg-left text-center">
                <h1 class="mb-0 mt-4 display-3" style="text-transform: uppercase"><spring:message key="intro.adora"/></h1>
                <p class="mb-5 lead"><spring:message key="intro.adora.intro"/></p>
            </div>
        </div>
    </div>
</div>
<!-- Intro -->
<div class="bg-dark py-5">
    <div class="container">
        <div class="row my-5 bg-secondary animate-in-down">
            <div class="p-4 col-md-6 bg-primary">
                <h2 class="mb-1"><spring:message key="intro.adora"/></h2> <i class="fa d-inline-block fa-star text-white"></i><i
                    class="fa d-inline-block fa-star mx-1 text-white"></i><i
                    class="fa d-inline-block fa-star text-white"></i>
                <p class="my-4"><spring:message key="intro.main"/></p>
                <img class="img-fluid d-block" src="<c:url value="/assets/restaurant/signature.png"/>" width="300">
            </div>
            <div class="p-0 col-md-6">
                <img class="img-fluid d-block" src="<c:url value="/assets/restaurant/chef_dark.jpg"/>"></div>
        </div>
    </div>
</div>
<!-- Gallery -->
<div class="">
    <div class="container-fluid">
        <div class="row">
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_12_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_11_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_10_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_9_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_8_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_7_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_7_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_6_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_4_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_3_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img src="<c:url value="/assets/restaurant/food_2_dark.jpg"/>" class="img-fluid"></div>
            <div class="p-0 col-md-2 col-4">
                <img class="img-fluid" src="<c:url value="/assets/restaurant/food_1_dark.jpg"/>"></div>
        </div>
    </div>
</div>
<!-- Menu -->
<div class="py-5 text-center" id="menu">
    <div class="container">
        <div class="row p-4 my-5 bg-primary animate-in-down">
            <div class="col-md-12">
                <h2 class="mt-3"><spring:message key="intro.menu"/></h2>
                <p class="mb-5"></p>
                <div class="row">
                    <div class="col-md-4">
                        <h5><spring:message key="intro.appetizer"/></h5>
                        <ul class="list-unstyled">
                            <c:forEach items="${dishes_1}" begin="1" end="5" var="d">
                                    <li class="my-4">${d.name} <br>[VND] ${d.price},000</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5><spring:message key="intro.dishes.main"/></h5>
                        <ul class="list-unstyled">
                            <c:forEach items="${dishes_2}" begin="1" end="5" var="d">
                                    <li class="my-4">${d.name} <br>[VND] ${d.price},000</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5><spring:message key="intro.dishes.dessert"/></h5>
                        <ul class="list-unstyled">
                            <c:forEach items="${dishes_3}" begin="1" end="5" var="d">
                                    <li class="my-4">${d.name} <br>[VND] ${d.price},000</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Carousel reviews -->
<!-- Carousel venue -->
<div class="py-3" id="venue">
    <div class="container">
        <div class="row my-5 bg-primary animate-in-down">
            <div class="p-4 col-md-6 align-self-center">
                <p class="mb-1"><spring:message key="intro.slide.p1"/></p>
                <h2 class=""><spring:message key="intro.slide.h1"/></h2>
                <p class="my-3"> <spring:message key="intro.bg"/> </p>
                <a href="#" class="btn-outline-light mb-3 p-2 btn"><spring:message key="intro.slide.view"/></a>
            </div>
            <div class="p-0 col-md-6">
                <div class="carousel slide" data-ride="carousel" id="carousel1">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_1_dark.jpg"
                                 atl="first slide">
                            <div class="carousel-caption">
                                <h3><spring:message key="intro.slide.p2"/></h3>
                                <p><spring:message key="intro.slide.h2"/></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_3_dark.jpg"
                                 data-holder-rendered="true">
                            <div class="carousel-caption">
                                <h3><spring:message key="intro.slide.p3"/></h3>
                                <p><spring:message key="intro.slide.h3"/></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_2_dark.jpg"
                                 data-holder-rendered="true">
                            <div class="carousel-caption">
                                <h3><spring:message key="intro.slide.p4"/></h3>
                                <p><spring:message key="intro.slide.h4"/></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_4_dark.jpg"
                                 data-holder-rendered="true">
                            <div class="carousel-caption">
                                <h3><spring:message key="intro.slide.p5"/></h3>
                                <p><spring:message key="intro.slide.h5"/></p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel1" role="button" data-slide="prev"> <span
                            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                            class="sr-only">Previous</span> </a>
                    <a class="carousel-control-next" href="#carousel1" role="button" data-slide="next"> <span
                            class="carousel-control-next-icon" aria-hidden="true"></span> <span
                            class="sr-only">Next</span> </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Events -->
<div class="py-5 bg-light">
    <div class="container">
        <div class="row animate-in-down">
            <div class="col-md-12">
                <p class="m-0 text-center">We gladly invite you to our happenings.</p>
                <h2 class="mb-3 text-primary text-center"></h2>
                <div class="row">
                    <div class="col-md-4 p-3">
                        <img class="img-fluid d-block w-100 mb-3"
                             src="<c:url value="/assets/restaurant/event_1_dark.jpg"/>">
                        <p class="lead text-muted mb-1"><spring:message key="intro.col.wed"/></p>
                        <h5 class="text-dark"><b><spring:message key="intro.col.wed.h"/></b></h5>
                        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt ut labore.</p>
                        <a href="#" class="btn btn-outline-secondary"><b class=""><spring:message key="intro.col.book"/></b></a>
                    </div>
                    <div class="col-md-4 p-3">
                        <img class="img-fluid d-block w-100 mb-3"
                             src="<c:url value="/assets/restaurant/event_2_dark.jpg"/>">
                        <p class="lead text-muted mb-1"><spring:message key="intro.col.Conference"/></p>
                        <h5 class="text-dark"><b><spring:message key="intro.col.Conference.h"/></b></h5>
                        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt.</p>
                        <a href="#" class="btn btn-outline-secondary"><b class=""><spring:message key="intro.col.book"/></b></a>
                    </div>
                    <div class="col-md-4 p-3">
                        <img class="img-fluid d-block w-100 mb-3"
                             src="<c:url value="/assets/restaurant/event_3_dark.jpg"/>">
                        <p class="lead text-muted mb-1"><spring:message key="intro.col.event"/></p>
                        <h5 class="text-dark" contenteditable="true"><b><spring:message key="intro.col.event.h"/></b></h5>
                        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna.</p>
                        <a href="#" class="btn btn-outline-secondary"><b class=""><spring:message key="intro.col.book"/></b></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Dark opaque section -->
<!-- Footer -->

<!-- JavaScript dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
<!-- Script: Smooth scrolling between anchors in the same page -->
<script src="<c:url value="/js/smooth-scroll.js"/>" style=""></script>
</body>
</html>



