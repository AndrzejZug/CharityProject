<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@include file="header.jsp" %>

<section class="stats" id="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${quantity}</em>
            <h3>Oddanych worków</h3>
            <p>Nasi użytkownicy przekazali już łącznie ${quantity} worków z podarunkami dla potrzebujących! Dołącz do nas!</p>
        </div>

        <div class="stats--item">
            <em>${countdonations}</em>
            <h3>Przekazanych darów</h3>
            <p>Liczba przekazanych darów to ${countdonations}. Tylko krok dzieli Cię od zostania kolejnym darczyńcą :)</p>
        </div>

    </div>
</section>

<section class="steps" id="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>
<sec:authorize access="isAnonymous()">
    <a href='<c:url value="/register" />' class="btn btn--large">Załóż konto</a>
</sec:authorize>
    <sec:authorize access="isAuthenticated()">
    <a href='<c:url value="/form" />' class="btn btn--large">Przekaż dary</a>
</sec:authorize>
</section>

<section class="about-us" id="about-us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help" id="help">
    <h2>Komu pomagamy?</h2>

    <!-- SLIDE 1 -->

    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>
        <ul class="help--slides-items">
            <c:forEach items="${institutions}" var="institution" varStatus="loopStatus" step="2">
                <c:if test="${not (loopStatus.index == institutions.size()-1 && loopStatus.index % 2 == 0)}">
                <li>
                <div class="col">
                    <div class="title"><c:out value="${institution.name}"/></div>
                    <div class="subtitle"><c:out value="${institution.description}"/></div>
                </div>

                    <div class="col">

                        <div class="title"><c:out value="${institutions[loopStatus.index+1].name}"/></div>
                        <div class="subtitle"><c:out value="${institutions[loopStatus.index+1].description}"/></div>

                    </div>

                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

</section>
<%@include file="footer.jsp" %>

</body>
</html>
