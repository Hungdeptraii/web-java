package com.nhl.controller.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhl.model.Cart;
import com.nhl.model.Category;
import com.nhl.model.Product;
import com.nhl.repository.CategoryRepository;
import com.nhl.repository.ProductRepository;
import com.nhl.service.WebsiteInfoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private WebsiteInfoService websiteInfoService;

    @GetMapping("/")
    public String homePage(Model model, HttpServletRequest request) {
        // Danh sách sản phẩm
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        // Danh sách danh mục
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);

        // Thông tin website
        Map<String, String> infoMap = websiteInfoService.getInfoWebsiteMap();
        model.addAttribute("infoWebsite", infoMap);

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

        return "web/front/index"; // trỏ đến: /WEB-INF/views/web/index.jsp
    }

    @GetMapping("/simple")
    @ResponseBody
    public String simpleHome() {
        return "<html><body><h1>Welcome to Web Java Application</h1><p>Application is running successfully!</p><p><a href='/login'>Login</a> | <a href='/register'>Register</a></p></body></html>";
    }

}
