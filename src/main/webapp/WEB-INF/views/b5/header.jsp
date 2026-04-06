<%--
  Created by IntelliJ IDEA.
  User: Thế Phong
  Date: 4/6/2026
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Mini HR Portal</h3>

<c:if test="${not empty sessionScope.loggedUser}">
    Xin chào:
    <c:out value="${sessionScope.loggedUser}"/>

    | <a href="<c:url value='/employees'/>">Employees</a>

    <c:if test="${sessionScope.role=='hr_manager'}">
        | Manager Menu
    </c:if>
</c:if>

<hr/>
</body>
</html>
