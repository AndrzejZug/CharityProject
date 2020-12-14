<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 14.12.2020
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Form</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@include file="header.jsp" %>

<form:form method="POST" modelAttribute="donation">
    Categories<form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id"/><br>
    institutions<form:select path="institution.id" items="${institutions}" itemLabel="name" itemValue="id"/><br>
    zipCode<form:input path="zipCode"/><br>
    street<form:input path="street"/><br>
    city<form:input path="city"/><br>
    quantity<form:input path="quantity"/><br>
    pickUpComment<form:textarea path="pickUpComment"/><br>
    pickUpDate<form:input type="date" path="pickUpDate"/><br>
    pickUpTime<form:input type="time" path="pickUpTime"/><br>
    <input type="submit" value="Wyślij">
</form:form>

<%@include file="footer.jsp" %>
</body>
</html>
