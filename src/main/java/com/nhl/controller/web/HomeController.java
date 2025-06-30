package com.nhl.controller.web;

import com.nhl.model.Product;
import com.nhl.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/")
    public String showProducts(Model model) {
        List<Product> products = productRepository.findAll();
        System.out.println("Có " + products.size() + " sản phẩm.");
        model.addAttribute("products", products);
        return "web/index";
    }

}
