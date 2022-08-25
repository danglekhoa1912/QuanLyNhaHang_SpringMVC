<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
                <h1 class="mb-0 mt-4 display-3">THE ADORA</h1>
                <p class="mb-5 lead">Đẳng cấp cho những điều quan trọng nhất</p>
            </div>
<%--            <div class="col-lg-5 p-3">--%>
<%--                <form class="p-4 bg-dark-opaque" method="post" action="https://formspree.io/">--%>
<%--                    <h4 class="mb-4 text-center">Đặt tiệc ngay</h4>--%>
<%--                    <div class="form-group"><label>Tên người đặt</label>--%>
<%--                        <input class="form-control" placeholder="Type here"></div>--%>
<%--                    <div class="form-group"><label>Thời gian</label>--%>
<%--                        <input type="time" class="form-control" placeholder="13"></div>--%>
<%--                    <div class="form-group"><label>Cout of peoples</label>--%>
<%--                        <input type="number" class="form-control" placeholder="2"></div>--%>
<%--                    <button type="submit" class="btn mt-4 btn-block btn-outline-primary p-2"><b>Tiến hành đặt</b>--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<!-- Intro -->
<div class="bg-dark py-5">
    <div class="container">
        <div class="row my-5 bg-secondary animate-in-down">
            <div class="p-4 col-md-6 bg-primary">
                <h2 class="mb-1">The Adora</h2> <i class="fa d-inline-block fa-star text-white"></i><i
                    class="fa d-inline-block fa-star mx-1 text-white"></i><i
                    class="fa d-inline-block fa-star text-white"></i>
                <p class="my-4">The ADORA Nguyễn Kiệm có vị trí vô cùng thuận tiện, tọa lạc ngay giao lộ huyết mạch Phạm
                    Văn Đồng tiếp nối các quận huyện trung tâm thành phố. The ADORA Nguyễn Kiệm được thiết kế theo phong
                    cách kiến trúc La Mã với các sảnh đường rộng lớn, được lựa chọn cho những buổi sự kiện trọng đại, từ
                    tiệc cưới, tiệc cá nhân tới các Hội nghị, hội thảo đẳng cấp.</p>
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
                <h2 class="mt-3">Menu</h2>
                <p class="mb-5"></p>
                <div class="row">
                    <div class="col-md-4">
                        <h5>Món khai vị</h5>
                        <ul class="list-unstyled">
                            <c:forEach items="${dishes}" var="d">
                                <c:if test="${d.categoryId.id==1}">
                                    <li class="my-4">${d.name} <br>[VND] ${d.price},000</li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Món chính</h5>
                        <ul class="list-unstyled">
                            <c:forEach items="${dishes}" var="d">
                                <c:if test="${d.categoryId.id==2}">
                                    <li class="my-4">${d.name} <br>[VND] ${d.price},000</li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Món tráng miệng</h5>
                        <ul class="list-unstyled">
                            <c:forEach items="${dishes}" var="d">
                                <c:if test="${d.categoryId.id==3}">
                                    <li class="my-4">${d.name} <br>[VND] ${d.price},000</li>
                                </c:if>
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
                <p class="mb-1">Feel comfortable, like home</p>
                <h2 class="">Sang trọng và lộng lẫy</h2>
                <p class="my-3">Mang vẻ nổi bật và lộng lẫy tọa lạc tại cung đường Hoàng Văn Thụ náo nhiệt bậc nhất Sài
                    Gòn. Trung tâm tiệc cưới The ADORA Luxury được xây dựng theo hình dáng của viên kim cương sang
                    trọng. Cả tòa nhà mang phong cách châu Âu với 6 sảnh tiệc rộng lớn cùng sức chứa lên đến 3.500
                    khách. </p>
                <a href="#" class="btn-outline-light mb-3 p-2 btn">View the gallery</a>
            </div>
            <div class="p-0 col-md-6">
                <div class="carousel slide" data-ride="carousel" id="carousel1">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_1_dark.jpg"
                                 atl="first slide">
                            <div class="carousel-caption">
                                <h3>Hội nghị</h3>
                                <p>Đẳng cấp và sang trọng</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_3_dark.jpg"
                                 data-holder-rendered="true">
                            <div class="carousel-caption">
                                <h3>Tiệc cưới</h3>
                                <p>Sang trọng và lộng lẫy</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_2_dark.jpg"
                                 data-holder-rendered="true">
                            <div class="carousel-caption">
                                <h3>Menu</h3>
                                <p>Đa dạng và đẳng cấp</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid w-100" src="assets/restaurant/venue_4_dark.jpg"
                                 data-holder-rendered="true">
                            <div class="carousel-caption">
                                <h3>Dịch vụ</h3>
                                <p>Tận tình và chuyên nghiệp</p>
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
                        <p class="lead text-muted mb-1">Tiệc cưới</p>
                        <h5 class="text-dark"><b>Phù hợp với tiệc cưới tầm trung</b></h5>
                        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt ut labore.</p>
                        <a href="#" class="btn btn-outline-secondary"><b class="">Book now!</b></a>
                    </div>
                    <div class="col-md-4 p-3">
                        <img class="img-fluid d-block w-100 mb-3"
                             src="<c:url value="/assets/restaurant/event_2_dark.jpg"/>">
                        <p class="lead text-muted mb-1">Hội nghị</p>
                        <h5 class="text-dark"><b>Phù hợp với tiệc cưới lớn</b></h5>
                        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt.</p>
                        <a href="#" class="btn btn-outline-secondary"><b class="">Go to event</b></a>
                    </div>
                    <div class="col-md-4 p-3">
                        <img class="img-fluid d-block w-100 mb-3"
                             src="<c:url value="/assets/restaurant/event_3_dark.jpg"/>">
                        <p class="lead text-muted mb-1">Sự kiện</p>
                        <h5 class="text-dark" contenteditable="true"><b>Đẳng cấp và sang trọng</b></h5>
                        <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna.</p>
                        <a href="#" class="btn btn-outline-secondary"><b class="">Read more</b></a>
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



