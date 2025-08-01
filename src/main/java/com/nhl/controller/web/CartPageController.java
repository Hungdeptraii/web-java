package com.nhl.controller.web;

import com.nhl.model.Cart;
import com.nhl.model.WebsiteInfo;
import com.nhl.repository.WebsiteInfoRepository;
import com.nhl.service.WebsiteInfoService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class CartPageController {

    @Autowired
    private WebsiteInfoService websiteInfoService;

    @GetMapping("/cart")
    public String showCartPage(HttpServletRequest request, Model model) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }

        Map<String, String> infoMap = websiteInfoService.getInfoWebsiteMap();
        model.addAttribute("infoWebsite", infoMap);

        model.addAttribute("cart", cart);
        model.addAttribute("pageTitle", "Giỏ hàng");
        model.addAttribute("activePage", "cart");

        return "web/front/cart"; // trỏ đến /WEB-INF/views/web/cart.jsp
    }
}
