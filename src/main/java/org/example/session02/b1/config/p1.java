package org.example.session02.b1.config;

public class p1 {
    // 1. lỗi trong MyWebAppInitializer.java
//    return new String[] {"/api/*"};
    // chỉ biết đến URL bắt đầu bằng /api/
    // http://localhost:8080/demo/welcome sai
    // http://localhost:8080/demi/api/welcome đúng
    // 2. WebConfig.java
    // @ComponentScan(basePackages = "com.demo.service")
    // Spring MVC chỉ scan bean trong package:
    // com.demo.service
    // Trong khi Controller nằm ở:
    // com.demo.controller
    // Spring không phát hiện @Controller
    // Không tạo bean WelcomeController
    // HandlerMapping không map được URL /welcome
}
