package org.example.session02.b3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {
    @GetMapping("/login")
    public String loginPage() {
        return "b3/login";
    }
    @PostMapping("/login")
    public String login(
        @RequestParam String username,
        @RequestParam String password,
        Model model,
        HttpSession session) {
        if(username.equals("admin") && password.equals("admin123")){
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "Admin");
            return "redirect:/orders";
        }
        if (username.equals("staff") && password.equals("staff123")) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "Staff");
            return "redirect:/orders";
        }
        model.addAttribute("lỗi", "sai tài khoản hoặc mật khẩu");
        return "b3/login";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
