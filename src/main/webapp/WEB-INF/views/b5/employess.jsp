<%--
  Created by IntelliJ IDEA.
  User: Thế Phong
  Date: 4/6/2026
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="header.jsp" %>
<table border="1">
    <tr>
        <th>#</th>
        <th>Tên</th>
        <th>Lương</th>
        <th>Ngày vào</th>
        <th>Trạng thái</th>
        <th></th>
    </tr>
    <c:forEach var="emp" items="${emps}" varStatus="st">
        <tr>
            <td>${st.count}</td>
            <td><c:out value="${emp.name}"/></td>
            <td>
                <fmt:formatNumber value="${emp.salary}" type="currency"/>
            </td>
            <td>
                <fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy"/>
            </td>
            <td>
                <c:choose>
                    <c:when test="${emp.status=='Đang làm'}">
                        <span style="color:green">Đang làm</span>
                    </c:when>
                    <c:when test="${emp.status=='Nghỉ phép'}">
                        <span style="color:orange">Nghỉ phép</span>
                    </c:when>
                    <c:otherwise>
                        <span style="color:blue">Thử việc</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="<c:url value='/employees/${emp.code}'/>">
                    Xem chi tiết
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<p>
    Tổng lương phòng Kỹ thuật:
    <fmt:formatNumber value="${totalTech}" type="currency"/>
</p>
<%@ include file="footer.jsp" %>
</body>
</html>
