<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 18.12.2020
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<%--<%@include file="../header.jsp" %>--%>
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
                <li><a href="#" class="btn btn--small btn--highlighted">Załóż konto</a></li>
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
    <h2>Zaloguj się</h2>
    <form method="post">
        <div class="form-group">
            <input type="email" name="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" />
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href='<c:url value="/register" />' class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
    </form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>