package com.nhl.controller.web;

import com.nhl.model.Product;
import com.nhl.model.Category;
import com.nhl.repository.ProductRepository;
import com.nhl.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping("")
    public String showEditProductsPage(Model model, HttpSession session) {
        Object user = session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<Product> products = productRepository.findAll();
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        return "web/back/editproducts";
    }

    @PostMapping("/add")
    public String addProduct(@RequestParam("name") String name,
                            @RequestParam("price") String priceStr,
                            @RequestParam("category_id") Long categoryId,
                            @RequestParam(value = "image", required = false) MultipartFile imageFile,
                            HttpServletRequest request,
                            HttpSession session) {
        Product product = new Product();
        product.setName(name);
        try {
            // Loại bỏ ký tự không phải số
            Integer price = Integer.parseInt(priceStr.replaceAll("[^0-9]", ""));
            product.setPrice(price);
        } catch (Exception e) {
            session.setAttribute("message", "Giá không hợp lệ!");
            session.setAttribute("messageType", "danger");
            return "redirect:/admin/products";
        }
        Category category = categoryRepository.findById(categoryId).orElse(null);
        product.setCategory(category);
        // Xử lý upload ảnh
        if (imageFile != null && !imageFile.isEmpty()) {
            String uploadDir = request.getServletContext().getRealPath("/template/products");
            String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
            try {
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();
                imageFile.transferTo(new File(dir, fileName));
                product.setImage(fileName);
            } catch (IOException e) {
                session.setAttribute("message", "Lỗi upload ảnh!");
                session.setAttribute("messageType", "danger");
                return "redirect:/admin/products";
            }
        }
        productRepository.save(product);
        session.setAttribute("message", "Thêm món thành công!");
        session.setAttribute("messageType", "success");
        return "redirect:/admin/products";
    }

    @PostMapping("/edit/{id}")
    public String editProduct(@PathVariable("id") Long id,
                              @RequestParam("name") String name,
                              @RequestParam("price") String priceStr,
                              @RequestParam("category_id") Long categoryId,
                              @RequestParam(value = "image", required = false) MultipartFile imageFile,
                              HttpServletRequest request,
                              HttpSession session) {
        Product product = productRepository.findById(id).orElse(null);
        if (product == null) {
            session.setAttribute("message", "Không tìm thấy món!");
            session.setAttribute("messageType", "danger");
            return "redirect:/admin/products";
        }
        product.setName(name);
        try {
            // Loại bỏ ký tự không phải số
            Integer price = Integer.parseInt(priceStr.replaceAll("[^0-9]", ""));
            product.setPrice(price);
        } catch (Exception e) {
            session.setAttribute("message", "Giá không hợp lệ!");
            session.setAttribute("messageType", "danger");
            return "redirect:/admin/products";
        }
        Category category = categoryRepository.findById(categoryId).orElse(null);
        product.setCategory(category);
        // Xử lý upload ảnh mới nếu có
        if (imageFile != null && !imageFile.isEmpty()) {
            String uploadDir = request.getServletContext().getRealPath("/template/products");
            String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
            try {
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();
                imageFile.transferTo(new File(dir, fileName));
                product.setImage(fileName);
            } catch (IOException e) {
                session.setAttribute("message", "Lỗi upload ảnh!");
                session.setAttribute("messageType", "danger");
                return "redirect:/admin/products";
            }
        }
        productRepository.save(product);
        session.setAttribute("message", "Cập nhật món thành công!");
        session.setAttribute("messageType", "success");
        return "redirect:/admin/products";
    }

    @PostMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id, HttpSession session) {
        Product product = productRepository.findById(id).orElse(null);
        if (product == null) {
            session.setAttribute("message", "Không tìm thấy món!");
            session.setAttribute("messageType", "danger");
            return "redirect:/admin/products";
        }
        productRepository.delete(product);
        session.setAttribute("message", "Xoá món thành công!");
        session.setAttribute("messageType", "success");
        return "redirect:/admin/products";
    }
} 