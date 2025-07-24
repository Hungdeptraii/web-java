package com.nhl.controller.web;

import com.nhl.model.Product;
import com.nhl.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductApiController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/by-category/{categoryId}")
    public List<Product> getProductsByCategory(@PathVariable("categoryId") Long categoryId) {
        if (categoryId == 0) {
            return productRepository.findAll();
        }
        return productRepository.findByCategoryId(categoryId);
    }

    @GetMapping("/search")
    public List<Product> searchProducts(@RequestParam("keyword") String keyword) {
        return productRepository.findByNameContainingIgnoreCase(keyword);
    }
}
