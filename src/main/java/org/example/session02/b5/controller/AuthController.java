package org.example.session02.b5.controller;

import jakarta.servlet.http.HttpSession;
import org.example.session02.b5.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {
    @Autowired
    private AuthService authService;
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(String username, String password, HttpSession session, Model model) {
        if (!authService.login(username,password)) {
            model.addAttribute("errorMessage",
                    "Sai tài khoản hoặc mật khẩu");
            return "login";
        }
        session.setAttribute("loggedUser",username);
        session.setAttribute("role",
                authService.role(username));
        return "redirect:/employees";
    }
}
