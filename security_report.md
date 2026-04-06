# Báo cáo phân tích bảo mật - JSTL và phòng thủ XSS

## 1. XSS là gì? Tại sao `<c:out value="${keyword}"/>` an toàn hơn `${keyword}`?

### XSS (Cross-Site Scripting)
XSS là lỗ hổng bảo mật cho phép kẻ tấn công chèn mã độc (thường là JavaScript) vào các trang web. Khi người dùng khác truy cập trang bị nhiễm, trình duyệt sẽ thực thi mã độc này, có thể dẫn đến:
- Đánh cắp cookie, session
- Thực hiện hành động thay mặt người dùng
- Chuyển hướng đến trang độc hại
- Hiển thị nội dung giả mạo

### So sánh an toàn giữa `<c:out>` và `${}`

**Khi dùng `${keyword}` với input `<script>alert('xss')</script>:**
```html
Kết quả tìm kiếm cho: <script>alert('xss')</script>
```
→ Trình duyệt thực thi script và hiển thị popup.

**Khi dùng `<c:out value="${keyword}"/>` với cùng input:**
```html
Kết quả tìm kiếm cho: &lt;script&gt;alert(&apos;xss&apos;)&lt;/script&gt;
```
→ Các ký tự đặc biệt được escape, script không được thực thi.

### HTML output được sinh ra

**Input:** `<script>alert(1)</script>`

**Với `${keyword}`:**
```html
<h3>Kết quả tìm kiếm cho: <script>alert(1)</script></h3>
```

**Với `<c:out value="${keyword}"/>`:**
```html
<h3>Kết quả tìm kiếm cho: &lt;script&gt;alert(1)&lt;/script&gt;</h3>
```

## 2. Sự khác nhau giữa `<c:if>` và `<c:choose>/<c:when>/<c:otherwise>`

### `<c:if>`
- Chỉ kiểm tra một điều kiện duy nhất
- Không có else/case khác
- Dùng cho các logic đơn giản

```jsp
<c:if test="${event.price == 0}">
    <span>MIỄN PHÍ</span>
</c:if>
```

### `<c:choose>/<c:when>/<c:otherwise>`
- Hỗ trợ nhiều điều kiện (if-else if-else)
- Chỉ thực thi case đầu tiên đúng
- Dùng cho logic phức tạp với nhiều nhánh

```jsp
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
```

### Trong bài này nên dùng loại nào?

**Phần "Giá vé":** Nên dùng `<c:choose>` vì có 3 trường hợp:
- price == 0 → "MIỄN PHÍ"
- price > 0 → định dạng số
- Các trường hợp khác (nếu có)

**Phần "Vé còn lại":** Nên dùng `<c:choose>` vì có 3 trường hợp:
- remainingTickets == 0 → "HẾT VÉ"
- remainingTickets < 10 → "Sắp hết"
- remainingTickets >= 10 → số bình thường

## 3. `<c:url>` giải quyết vấn đề gì so với hardcode URL?

### Vấn đề với hardcode URL
```jsp
<a href="/events/1/book">Đặt vé</a>
```

Khi deploy với context path `/ticketing`, URL thực tế sẽ là:
- Sai: `http://localhost:8080/events/1/book` (404)
- Đúng: `http://localhost:8080/ticketing/events/1/book`

### Giải pháp với `<c:url>`
```jsp
<c:url value="/events/${event.id}/book" var="bookUrl"/>
<a href="${bookUrl}">Đặt vé</a>
```

**Ưu điểm:**
- Tự động thêm context path
- URL encoding các tham số
- Hỗ trợ rewrite URL
- Đảm bảo ứng dụng hoạt động đúng với mọi context path

### Khi deploy với context path `/ticketing`
**Hardcode:** `/events/1/book` → Không hoạt động
**`<c:url>`:** `/ticketing/events/1/book` → Hoạt động đúng

## 4. Các biện pháp bảo mật đã áp dụng

1. **XSS Protection:** Tất cả user input đều qua `<c:out>`
2. **Input Validation:** Kiểm tra null/empty trước khi truy cập array
3. **URL Safety:** Dùng `<c:url>` để tránh context path issues
4. **No Scriptlets:** JSP thuần JSTL/EL, giảm rủi ro bảo mật
5. **Output Encoding:** `<c:out escapeXml="true"` (default)

## 5. Kết luận

Việc sử dụng JSTL và EL thay vì Scriptlet không chỉ giúp code sạch hơn mà còn tăng cường bảo mật đáng kể. `<c:out>` là công cụ quan trọng để phòng chống XSS, trong khi `<c:url>` đảm bảo ứng dụng hoạt động đúng trong mọi môi trường deployment.
