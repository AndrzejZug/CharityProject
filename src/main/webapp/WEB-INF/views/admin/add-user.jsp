<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 18.12.2020
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add user</title>
</head>
<body>
<h1>Fill the form below to Add new User</h1>
<form:form method = "POST" modelAttribute = "carUser">
    Email<form:input path="email"/><br>
    Error: ${message} <form:errors path="email"/><br/>
    Password<form:input path="password"/><br>
        <form:errors path="password"/><br/>
    Name<form:input path="firstName"/><br>
        <form:errors path="firstName"/><br/>
    Surname<form:input path="lastName"/><br>
        <form:errors path="lastName"/><br/>
    Enabled<form:input path="enabled"/><br>
    <form:errors path="enabled"/><br/>
    Role<form:checkboxes path="roles" items="${roles}" itemLabel="name" itemValue="id"/><br>
        <form:errors path="roles"/><br/>
    <input type="submit" value="Save">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>
</body>
</html>
