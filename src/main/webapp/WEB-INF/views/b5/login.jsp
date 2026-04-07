<%--
  Created by IntelliJ IDEA.
  User: Thế Phong
  Date: 4/6/2026
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Login</h2>

<form action="<c:url value='/login'/>" method="post">
    Username: <input name="username"/><br>
    Password: <input type="password" name="password"/><br>
    <button>Login</button>
</form>

<c:if test="${not empty errorMessage}">
    <p style="color:red">
        <c:out value="${errorMessage}"/>
    </p>
</c:if>
</body>
</html>
