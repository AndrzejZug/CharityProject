<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="header--main-page">
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
                <sec:authorize access="isAnonymous()">
                <li><a href='<c:url value="/login" />' class="btn btn--without-border">Przekaż dary</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li><a href='<c:url value="/form" />' class="btn btn--without-border">Przekaż dary</a></li>
                </sec:authorize>
                <li><a href='<c:url value="/start#contact" />' class="btn btn--without-border">Kontakt</a></li>
            </ul>
        </nav>

        <div class="slogan container container--90">
            <div class="slogan--item">
                <h1>
                    Zacznij pomagać!<br/>
                    Oddaj niechciane rzeczy w zaufane ręce
                </h1>
            </div>
        </div>
</header>