<%--
  Created by IntelliJ IDEA.
  User: Thế Phong
  Date: 4/6/2026
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Xin chào, ${loggedUser}
    Vai trò: ${role}</h2>
    <a href="logout">Đăng xuất</a>
    <table>
        <thead>
            <tr>
                <th>Mã</th>
                <th>Ngày</th>
                <th>Sản phẩm</th>
                <th>Giá</th>
            </tr>
            <c:forEach var="o" items="${orderList}">
                <tr>
                    <td>${o.code}</td>
                    <td>${o.product}</td>
                    <td>
                        <fmt:formatNumber value="${o.total}" type="currency"/>
                    </td>
                    <td>
                        <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy"/>
                    </td>
                </tr>
            </c:forEach>
        </thead>
    </table>
    <h3>Tổng lượt xem đơn: ${totalViewCount}</h3>
</body>
</html>
