Báo cáo phân tích bảo mật - JSTL và phòng thủ XSS
XSS là gì? Tại sao <c:out value="${keyword}"/> an toàn hơn ${keyword}?
XSS (Cross-Site Scripting)
XSS là lỗ hổng bảo mật cho phép kẻ tấn công chèn mã độc (thường là JavaScript) vào các trang web. Khi người dùng khác truy cập trang bị nhiễm, trình duyệt sẽ thực thi mã độc này, có thể dẫn đến:
Đánh cắp cookie, session
Thực hiện hành động thay mặt người dùng
Chuyển hướng đến trang độc hại
Hiển thị nội dung giả mạo
So sánh an toàn giữa <c:out> và ${}
Khi dùng ${keyword} với input <script>alert('xss')</script>:
Kết quả tìm kiếm cho: <script>alert('xss')</script>
→ Trình duyệt thực thi script và hiển thị popup.
Khi dùng <c:out value="${keyword}"/> với cùng input:
Kết quả tìm kiếm cho: &lt;script&gt;alert(&apos;xss&apos;)&lt;/script&gt;
→ Các ký tự đặc biệt được escape, script không được thực thi.
HTML output được sinh ra
Input: <script>alert(1)</script>
Với ${keyword}:
<h3>Kết quả tìm kiếm cho: <script>alert(1)</script></h3>
Với <c:out value="${keyword}"/>:
<h3>Kết quả tìm kiếm cho: &lt;script&gt;alert(1)&lt;/script&gt;</h3>
Sự khác nhau giữa <c:if> và <c:choose>/<c:when>/<c:otherwise>
<c:if>
Chỉ kiểm tra một điều kiện duy nhất
Không có else/case khác
Dùng cho các logic đơn giản
<c:if test="${event.price == 0}">
<span>MIỄN PHÍ</span>
</c:if>
<c:choose>/<c:when>/<c:otherwise>
Hỗ trợ nhiều điều kiện (if-else if-else)
Chỉ thực thi case đầu tiên đúng
Dùng cho logic phức tạp với nhiều nhánh
<c:choose>
<c:when test="${event.price == 0}">
<span>MIỄN PHÍ</span>
</c:when>
<c:when test="${event.price < 100000}">
<span>RẺ</span>
</c:when>
<c:otherwise>
<span>ĐẮT</span>
</c:otherwise>
</c:choose>
Trong bài này nên dùng loại nào?
Phần "Giá vé": nên dùng <c:choose> vì có nhiều trường hợp:
price == 0 → "MIỄN PHÍ"
price > 0 → định dạng số
Các trường hợp khác nếu có
Phần "Vé còn lại": nên dùng <c:choose> vì có nhiều trạng thái:
remainingTickets == 0 → "HẾT VÉ"
remainingTickets < 10 → "Sắp hết"
remainingTickets >= 10 → hiển thị số bình thường
<c:url> giải quyết vấn đề gì so với hardcode URL?
Vấn đề với hardcode URL
<a href="/events/1/book">Đặt vé</a>
Khi deploy với context path /ticketing, URL thực tế sẽ là:
Sai: http://localhost:8080/events/1/book (404)
Đúng: http://localhost:8080/ticketing/events/1/book
Giải pháp với <c:url>
<c:url value="/events/${event.id}/book" var="bookUrl"/>
<a href="${bookUrl}">Đặt vé</a>
Ưu điểm
Tự động thêm context path
URL encoding tham số
Hỗ trợ URL rewriting
Đảm bảo ứng dụng hoạt động đúng ở mọi môi trường deploy
Khi deploy với context path /ticketing
Hardcode: /events/1/book → Không hoạt động
<c:url>: /ticketing/events/1/book → Hoạt động đúng
Các biện pháp bảo mật đã áp dụng
XSS Protection: tất cả user input đều xuất qua <c:out>
Input Validation: kiểm tra null hoặc empty trước khi xử lý dữ liệu
URL Safety: sử dụng <c:url> thay vì hardcode đường dẫn
Không dùng Scriptlet: JSP thuần JSTL và EL giúp giảm rủi ro bảo mật
Output Encoding: <c:out escapeXml="true"> (mặc định)
Kết luận
Việc sử dụng JSTL và EL thay cho Scriptlet giúp mã nguồn rõ ràng, dễ bảo trì và tăng cường bảo mật cho ứng dụng web. <c:out> đóng vai trò quan trọng trong phòng chống XSS thông qua cơ chế escape dữ liệu đầu ra, trong khi <c:url> đảm bảo URL luôn chính xác bất kể context path khi triển khai hệ thống.