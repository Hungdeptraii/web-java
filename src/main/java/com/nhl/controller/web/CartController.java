package com.nhl.controller.web;

import com.nhl.model.Cart;
import com.nhl.model.Product;
import com.nhl.repository.ProductRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductRepository productRepository;

    @PostMapping("/add")
    public Map<String, Object> addToCart(@RequestParam("productId") Long productId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        Product product = productRepository.findById(productId).orElse(null);
        if (product != null) {
            cart.add(product);
            request.getSession().setAttribute("cart", cart);
            result.put("success", true);
            result.put("message", "Đã thêm vào giỏ hàng");
        } else {
            result.put("success", false);
            result.put("message", "Sản phẩm không tồn tại");
        }
        return result;
    }

}
