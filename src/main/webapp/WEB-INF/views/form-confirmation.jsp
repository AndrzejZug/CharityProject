<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 18.12.2020
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Form confirmation</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj Agata
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href='<c:url value="/start" />' class="btn btn--without-border active">Start</a></li>
            <li><a href='<c:url value="/start#steps" />' class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href='<c:url value="/start#about-us" />' class="btn btn--without-border">O nas</a></li>
            <li><a href='<c:url value="/start#help" />' class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href='<c:url value="/start#contact" />' class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <h2>
            Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
            informacje o odbiorze.
        </h2>
    </div>
</header>
<%@include file="footer.jsp" %>
</body>
</html>

