package org.example.session02.b5.controller;

public class EmployeeNotFoundException extends RuntimeException {
    public EmployeeNotFoundException(String code) {
        super("Nhân viên [" + code + "] không tôn tai trong hê thông");
    }

}
