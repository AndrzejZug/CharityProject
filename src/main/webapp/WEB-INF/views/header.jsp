<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="#" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="#" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="/start" class="btn btn--without-border active">Start</a></li>
<%--            <li><a href='<c:url value="/start" />#steps' class="btn btn--without-border">O co chodzi?</a></li>--%>
            <li><a href='/start#steps' class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href='<c:url value="/start" />#about-us' class="btn btn--without-border">O nas</a></li>
            <li><a href='<c:url value="/start#help" />' class="btn btn--without-border">Fundacje i organizacje</a></li>
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