package com.nhl.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String adminHome(Model model, HttpSession session) {
        Object user = session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("activePage", "admin");
        // Nếu đã đăng nhập thì cho vào trang admin
        return "web/back/home"; // JSP path: /WEB-INF/views/web/back/home.jsp
    }
}
