package com.nhl.controller.web;

import com.nhl.model.Product;
import com.nhl.model.Cart;
import com.nhl.model.WebsiteInfo;
import com.nhl.model.Category;
import com.nhl.repository.ProductRepository;
import com.nhl.repository.CategoryRepository;
import com.nhl.repository.WebsiteInfoRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private WebsiteInfoRepository websiteInfoRepository;

    @GetMapping("/")
    public String homePage(Model model, HttpServletRequest request) {
        // Danh sách sản phẩm
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        // Danh sách danh mục
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);

        // Thông tin website
        WebsiteInfo infoWebsite = websiteInfoRepository.findFirstByOrderByIdAsc();
        model.addAttribute("infoWebsite", infoWebsite);

        // Lấy hoặc tạo giỏ hàng trong session
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        model.addAttribute("cart", cart);

        // Tiêu đề trang và đánh dấu tab đang active
        model.addAttribute("pageTitle", "Trang chủ");
        model.addAttribute("activePage", "home");

        // Tham số 'ban' (nếu có)
        String ban = request.getParameter("ban");
        if (ban != null && !ban.trim().isEmpty()) {
            model.addAttribute("ban", ban);
        }

        return "web/index"; // trỏ đến: /WEB-INF/views/web/index.jsp
    }

}
