package com.nhl.controller.web;

import com.nhl.model.Cart;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartPageController {

    @GetMapping("/cart")
    public String showCartPage(HttpServletRequest request, Model model) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (cart == null) {
            cart = new Cart(); // tạo mới nếu giỏ hàng trống
            request.getSession().setAttribute("cart", cart);
        }

        model.addAttribute("cart", cart);
        model.addAttribute("pageTitle", "Giỏ hàng");
        model.addAttribute("activePage", "cart");

        return "web/cart"; // trỏ đến /WEB-INF/views/web/cart.jsp
    }
}
