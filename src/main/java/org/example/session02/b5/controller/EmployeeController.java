package org.example.session02.b5.controller;

import jakarta.servlet.http.HttpSession;
import org.example.session02.b5.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
    @Autowired
    private EmployeeService service;
    private void checkLogin(HttpSession session) {
        if(session.getAttribute("loggedUser")==null)
            throw new RuntimeException("Chưa đăng nhập");
    }
    @GetMapping
    public String list(Model model,
                       HttpSession session) {
        checkLogin(session);
        model.addAttribute("emps",service.findAll());
        model.addAttribute("totalTech",
                service.totalTechnicalSalary());
        return "employees";
    }
    @GetMapping("/{code}")
    public String detail(@PathVariable String code,
                         Model model,
                         HttpSession session) {
        checkLogin(session);
        model.addAttribute("emp",
                service.findByCode(code));
        return "b5/employee-detail";
    }
}
