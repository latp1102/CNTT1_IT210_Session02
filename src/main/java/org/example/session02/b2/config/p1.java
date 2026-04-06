package org.example.session02.b2.config;

public class p1 {
    // <%! private int requestCounter %>
    // Biến khai báo ở Declaration là biến dùng chung cho
    // toàn bộ Servlet → nhiều user truy cập đồng thời làm sai dữ liệu, không thread-safe
    // Scriptlet <% %> lấy dữ liệu
    // JSP chứa logic Java → View không còn khó bảo trì, sai kiến trúc MVC.
    // for Xếp loại sinh viên được xử lý ở View thay vì Controller/Service → code smell
    // <%= sv.getFullName() %>
    // In trực tiếp dữ liệu người dùng mà ko escape -> có thể chèn script độc
    // <%= sv.getScore() %>;
    // thứa dấu ; html hien thị sai dữ liệu
    // HTML Comment <!-- -->
    // html comment vẫn gửi xuống cilent thông tin lj, nên dùng JSP comment
    // <%-- --%> ko dùng EL${} khó đọc ko theo chuẩn spring mvc
}
