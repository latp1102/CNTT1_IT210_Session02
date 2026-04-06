<%--
  Created by IntelliJ IDEA.
  User: Thế Phong
  Date: 4/6/2026
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>login</h2>
    <form method="post" action="login">
        Username: <input name="username" />
        Password: <input type="password" name="password" />
        <button>Login</button>
    </form>
    <p style="color: red">${error}</p>
</body>
</html>
