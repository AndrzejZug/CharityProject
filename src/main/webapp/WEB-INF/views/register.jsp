<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 21.12.2020
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Register</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header>
    <sec:authorize access="isAuthenticated()">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj <sec:authentication property="principal.username"/>
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href='<c:url value="/logout"/>'>Wyloguj</a></li>
                </ul>
            </li>
        </ul>
        </sec:authorize>

        <sec:authorize access="isAnonymous()">
        <nav class="container container--70">
            <ul class="nav--actions">
                <li><a href='<c:url value="/login" />' class="btn btn--small btn--without-border">Zaloguj</a></li>
                <li><a href='<c:url value="/register" />' class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </ul>
            </sec:authorize>
            <ul>
                <li><a href='<c:url value="/start" />' class="btn btn--without-border active">Start</a></li>
                <li><a href='<c:url value="/start#steps" />' class="btn btn--without-border">O co chodzi?</a></li>
                <li><a href='<c:url value="/start#about-us" />' class="btn btn--without-border">O nas</a></li>
                <li><a href='<c:url value="/start#help" />' class="btn btn--without-border">Fundacje i organizacje</a>
                </li>
                <%--                <sec:authorize access="isAnonymous()">--%>
                <%--                    <li><a href='<c:url value="/login" />' class="btn btn--without-border">Przekaż dary</a></li>--%>
                <%--                </sec:authorize>--%>
                <li><a href='<c:url value="/start#contact" />' class="btn btn--without-border">Kontakt</a></li>
            </ul>
        </nav>
</header>

<section class="login-page">

    <h2>Załóż konto</h2>
    <form:form method="POST" modelAttribute="carUser">
        <div class="form-group">
            <form:input path="email" type="email" placeholder="Email"/><br>
        </div>
        ${message} <form:errors path="email"/><br/>
        <div class="form-group">
            <form:input path="password" type="password" placeholder="Hasło"/><br>
            <form:errors path="password"/><br/>
        </div>
        <div class="form-group">
            <form:input path="firstName" type="text" placeholder="Imię"/><br>
            <form:errors path="firstName"/><br/>
        </div>
        <div class="form-group">
            <form:input path="lastName" type="text" placeholder="Nazwisko"/><br>
            <form:errors path="lastName"/><br/>
        </div>
        <form:hidden path="enabled"/><br>
        <form:errors path="enabled"/><br/>
        <form:hidden path="roles" items="${roles}" itemLabel="name" itemValue="id"/><br>
        <form:errors path="roles"/><br/>
    <div class="form-group form-group--buttons">
        <a href='<c:url value="/login" />' class="btn btn--without-border">Zaloguj się</a>
        <button class="btn" type="submit">Załóż konto</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
    </form:form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
