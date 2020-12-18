<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 18.12.2020
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User list</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <form action="<c:url value="/logout"/>" method="post">
        <input type="submit" value="Wyloguj">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</sec:authorize>
<h1>List of Users</h1>
<h2><a href="${pageContext.request.contextPath}/admin/add-user">Add user</a><br><br>
    <table border="1">
        <thead>
        <th>Email</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Enabled</th>
        <th>Role</th>
        </thead>
        <tbody>
        <c:forEach items="${carUsers}" var="user">
        <tr>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.firstName}"/></td>
            <td><c:out value="${user.lastName}"/></td>
            <td><c:out value="${user.enabled}"/></td>
            <td>
            <c:forEach items="${user.roles}" var="role">
                ${role.name}
            </c:forEach>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>

