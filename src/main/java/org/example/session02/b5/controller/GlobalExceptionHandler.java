package org.example.session02.b5.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(EmployeeNotFoundException.class)
    public String handle(EmployeeNotFoundException ex, Model model){
        model.addAttribute("errorMessage", "Nhân viên ["+ex.getMessage()+"] không tồn tại trong hệ thống"
        );
        return "b5/error";
    }
}
