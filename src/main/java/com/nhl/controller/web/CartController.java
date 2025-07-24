package com.nhl.controller.web;

import com.nhl.model.Cart;
import com.nhl.model.CartItem;
import com.nhl.model.Product;
import com.nhl.repository.ProductRepository;
import com.nhl.model.CustomerOrder;
import com.nhl.model.CustomerOrderItem;
import com.nhl.repository.CustomerOrderRepository;
import com.nhl.repository.CustomerOrderItemRepository;
import com.nhl.dto.CheckoutRequest;
import com.nhl.dto.CartItemDTO;
import com.nhl.dto.CustomerInfoDTO;
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
    @Autowired
    private CustomerOrderRepository customerOrderRepository;
    @Autowired
    private CustomerOrderItemRepository customerOrderItemRepository;

    public String renderCartHtml(Cart cart) {
        StringBuilder sb = new StringBuilder();
        if (cart.getItems() != null && !cart.getItems().isEmpty()) {
            for (CartItem item : cart.getItems().values()) {
                sb.append("<tr class=\"text-center\">")
                        .append("<td class=\"product-remove\">")
                        .append("<a href=\"javascript:void(0)\" id=\"xoa_cart_").append(item.getProduct().getId()).append("\"><span class=\"icon-close\"></span></a>")
                        .append("</td>")
                        .append("<td class=\"image-prod\"><div class=\"img\" style=\"background-image: url('/template/products/")
                        .append(item.getProduct().getImage())
                        .append("'); width:60px; height:60px; background-size:cover;\"></div></td>")
                        .append("<td class=\"product-name\"><h3>")
                        .append(item.getProduct().getName())
                        .append("</h3></td>")
                        .append("<td class=\"price\">")
                        .append(String.format("%,d", item.getProduct().getPrice()))
                        .append(" VNĐ</td>")
                        .append("<td class=\"quantity\"><div class=\"input-group mb-3\">")
                        .append("<input type=\"text\" id=\"quantity_cart_").append(item.getProduct().getId())
                        .append("\" name=\"quantity\" class=\"quantity form-control input-number\" value=\"")
                        .append(item.getQuantity()).append("\" min=\"1\" max=\"100\">")
                        .append("</div></td>")
                        .append("<td id=\"total_").append(item.getProduct().getId()).append("\" class=\"total\">")
                        .append(String.format("%,d", item.getProduct().getPrice() * item.getQuantity()))
                        .append(" VNĐ</td>")
                        .append("</tr>");
                // Có thể append thêm đoạn <script> cho mỗi row (tương tự partial JSP)
            }
        } else {
            sb.append("<tr><td colspan=\"6\" class=\"text-center\">Chưa có sản phẩm nào trong giỏ.</td></tr>");
        }
        return sb.toString();
    }

    @PostMapping("/add")
    public Map<String, Object> addToCart(@RequestParam("productId") Long productId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
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
        result.put("totalQuantity", cart.getTotalQuantity());
        return result;
    }

    @GetMapping("/remove")
    public Map<String, Object> removeFromCart(@RequestParam("id") Long productId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        cart.remove(productId);
        request.getSession().setAttribute("cart", cart);

        result.put("thanhTien", String.format("%,d VNĐ", cart.getTotalPrice()));
        result.put("totalPrice", String.format("%,d VNĐ", (long)(cart.getTotalPrice()))); // 10% VAT
        result.put("totalQuantity", cart.getTotalQuantity());

        // Nếu muốn cập nhật bảng giỏ hàng qua AJAX:
         result.put("html", renderCartHtml(cart));
        return result;
    }

    @GetMapping("/update")
    public Map<String, Object> updateCartQuantity(
            @RequestParam("id") Long productId,
            @RequestParam("quantity") int quantity,
            HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        cart.update(productId, quantity);
        request.getSession().setAttribute("cart", cart);

        result.put("thanhTien", String.format("%,d VNĐ", cart.getTotalPrice()));
        result.put("totalPrice", String.format("%,d VNĐ", cart.getTotalPrice()));
        result.put("totalQuantity", cart.getTotalQuantity());
        // Nếu muốn cập nhật bảng giỏ hàng qua AJAX:
         result.put("html", renderCartHtml(cart));
        return result;
    }

    @PostMapping("/checkout")
    @ResponseBody
    public Map<String, Object> checkout(@RequestBody CheckoutRequest request, HttpServletRequest servletRequest) {
        // Kiểm tra giỏ hàng trong session
        Cart cart = (Cart) servletRequest.getSession().getAttribute("cart");
        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
            Map<String, Object> result = new HashMap<>();
            result.put("success", false);
            result.put("message", "Giỏ hàng đã trống hoặc đã được đặt!");
            return result;
        }

        // Lưu vào customer_orders
        CustomerInfoDTO info = request.getInfo();
        CustomerOrder order = new CustomerOrder();
        order.setFullname(info.getFullname());
        order.setPhone(info.getPhone());
        order.setAddress(info.getAddress());
        order.setNote(info.getNote());

        char randomChar = (char) ('A' + (int)(Math.random() * 26));
        int randomNumber = (int) (Math.random() * 10000);
        String orderCode = randomChar + String.valueOf(randomNumber);
        order.setCode(orderCode);
        order.setBan(info.getBan());
        customerOrderRepository.save(order);

        // Lưu từng món vào customer_order_items
        for (CartItemDTO item : request.getItems()) {
            CustomerOrderItem orderItem = new CustomerOrderItem();
            orderItem.setOrderId(order.getId());
            orderItem.setProductId(item.getProductId());
            orderItem.setQuantity(item.getQuantity());
            // Lấy giá sản phẩm từ DB thay vì lấy từ client
            Product product = productRepository.findById(item.getProductId()).orElse(null);
            if (product != null) {
                orderItem.setPrice(product.getPrice());
            } else {
                orderItem.setPrice(0); // hoặc xử lý lỗi nếu cần
            }
            customerOrderItemRepository.save(orderItem);
        }

        // Xóa giỏ hàng trong session NGAY SAU KHI TẠO ĐƠN
        servletRequest.getSession().removeAttribute("cart");

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("orderCode", order.getCode());
        return result;
    }

}
