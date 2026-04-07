package org.example.session02.b3.controller;

import org.example.session02.b3.model.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @GetMapping("/orders")
    public String orders(HttpSession session, ServletContext application, Model model) {
        if(session.getAttribute("loggedUser") ==null){
            return "redirect:/login";
        }
        List<Order> orderList = new ArrayList<>();
        orderList.add(new Order("1", new Date(), "Product 1", 100.0));
        orderList.add(new Order("2", new Date(), "Product 2", 200.0));
        orderList.add(new Order("3", new Date(), "Product 3", 300.0));
        model.addAttribute("orderList", orderList);
        // chống Race Condition
        synchronized (application){
            Integer count = (Integer) application.getAttribute("totalViewCount");
            if (count==null){
                count=0;
            }
            application.setAttribute("totalViewCount", count+1);
        }
        return "b3/orders";
    }
}
