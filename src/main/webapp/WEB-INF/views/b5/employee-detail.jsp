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
<%@ include file="header.jsp" %>

Tên:
<c:out value="${emp.name}"/><br>
Lương:
<c:choose>
    <c:when test="${sessionScope.role=='hr_manager'}">
        <c:out value="${emp.salary}"/>
    </c:when>
    <c:otherwise>
        ***
    </c:otherwise>
</c:choose>
<br><br>
<a href="<c:url value='/employees'/>">Quay lại</a>
<%@ include file="footer.jsp" %>
</body>
</html>
