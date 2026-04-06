<%--
  Created by IntelliJ IDEA.
  User: Thế Phong
  Date: 4/6/2026
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%-- Tiêu đề trang báo cáo --%>
    <title>${reportTitle}</title>
</head>
<body>
    <h1>${reportTitle}</h1>
    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Họ và tên</th>
            <th>Điểm</th>
            <th>Xếp loại</th>
        </tr>
        <c:forEach var="sv" items="${studentList}" varStatus="st">
            <tr>
                <td>${st.index + 1}</td>
                <td><c:out value="${sv.fullName}" /></td>
                <td>${st.score}</td>
                <td>
                    <c:choose>
                        <c:when test="${st.score >= 90}">Xuất sắc</c:when>
                        <c:when test="${st.score >= 80}">Giỏi</c:when>
                        <c:when test="${st.score >= 70}">Khá</c:when>
                        <c:when test="${st.score >= 60}">Trung bình</c:when>
                        <c:when test="${st.score >= 50}">Yếu</c:when>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </thead>
    </table>
</body>
</html>
