<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm kiếm sự kiện</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #f5f5f5; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        .no-results { color: #d9534f; font-weight: bold; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .free-badge { background: #5cb85c; color: white; padding: 2px 6px; border-radius: 3px; font-size: 12px; }
        .sold-out { color: #d9534f; font-weight: bold; }
        .low-tickets { color: #f0ad4e; font-weight: bold; }
        .normal-tickets { color: #5cb85c; }
        .disabled-link { color: #999; text-decoration: none; cursor: not-allowed; }
        .footer { margin-top: 30px; padding: 15px; background: #f9f9f9; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>Tìm kiếm sự kiện</h1>
    
    <div class="header">
        <h3>Kết quả tìm kiếm cho: <c:out value="${keyword}"/></h3>
        <p>Tìm thấy ${totalFound} sự kiện</p>
        <c:if test="${empty events}">
            <p class="no-results">Không tìm thấy sự kiện nào phù hợp.</p>
        </c:if>
    </div>

    <c:if test="${not empty events}">
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sự kiện</th>
                    <th>Ngày tổ chức</th>
                    <th>Giá vé</th>
                    <th>Vé còn lại</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="event" items="${events}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td><c:out value="${event.name}"/></td>
                        <td>${event.eventDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${event.price == 0}">
                                    <span class="free-badge">MIỄN PHÍ</span>
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${event.price}" pattern="#,##0" đ=""/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${event.remainingTickets == 0}">
                                    <span class="sold-out">HẾT VÉ</span>
                                </c:when>
                                <c:when test="${event.remainingTickets < 10}">
                                    <span class="low-tickets">Sắp hết (còn ${event.remainingTickets} vé)</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="normal-tickets">${event.remainingTickets}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${event.remainingTickets == 0}">
                                    <span class="disabled-link">Đặt vé</span>
                                </c:when>
                                <c:otherwise>
                                    <c:url value="/events/${event.id}/book" var="bookUrl"/>
                                    <a href="${bookUrl}">Đặt vé</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="footer">
        <h3>Thông tin bổ sung</h3>
        <c:if test="${not empty events}">
            <p><strong>Tên sự kiện đầu tiên (chữ hoa):</strong> ${fn:toUpperCase(events[0].name)}</p>
        </c:if>
        <p><strong>Số ký tự từ khóa:</strong> ${fn:length(keyword)} ký tự</p>
    </div>
</body>
</html>
