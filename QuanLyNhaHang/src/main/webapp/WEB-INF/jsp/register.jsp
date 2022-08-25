<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="<c:url value="/css/register.css"/>" type="text/css">

<div class="align-items-center d-flex   py-5 cover"
     style="background-image: url(<c:url value="/assets/restaurant/cover_dark.jpg"/>);">
    <div class="container bg-dark">
        <div class="text-center">
            <h1>Register</h1>
            <p>Please fill in this form to create an account.</p>
        </div>
        <c:if test="${errorMess!=null}">
            <div class="alert alert-danger" >${errorMes}</div>
        </c:if>
        <c:url value="/register" var="action" />
        <form:form enctype="multipart/form-data"  modelAttribute="user" class="p-4 form" action="${action}" method="post" >
<%--            <form:errors path="*" cssClass="alert alert-danger" element="div"/>--%>
            <div class="form-group">
                <label for="email"><b>Email</b></label>
                <form:input path="email" type="text"  name="email" id="email"  />
                <form:errors path="email" cssClass=" text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label for="email"><b>Name</b></label>
                <form:input path="name" type="text"  name="name" id="name"  />
                <form:errors path="name" cssClass="text-danger" element="div"/>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label for="phone"><b>Phone</b></label>
                        <form:input type="text" path="mobile" name="phone" id="phone" />
                        <form:errors path="mobile" cssClass="text-danger" element="div"/>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="birth-day"><b>Birth Day</b></label>
                        <form:input type="date" path="birthday" name="birth-day"  id="birth-day" year="${now}" />
                        <form:errors path="birthday" cssClass="text-danger" element="div"/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="password"><b>Password</b></label>
                <form:input type="password" path="password" name="password" id="password" />
                <form:errors path="password" cssClass="text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label for="confirmPassword"><b>Confirm Password</b></label>
                <form:input type="password" path="confirmPassword" name="confirmPassword" id="confirmPassword" />
                <form:errors path="confirmPassword" cssClass="text-danger" element="div"/>
            </div>
            <div class="form-group">
                <label  for="imageId">Choose file</label>
                <form:input  accept="image/png, image/jpeg" type="file" path="img" name="imageId" id="imageId" />
                <form:errors path="img" cssClass="text-danger" element="div"/>
            </div>
            <hr>
            <input type="submit" class="registerbtn">Register</input>
        </form:form>
    </div>
</div>