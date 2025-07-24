package com.nhl.controller.web;

import com.nhl.model.CustomerOrder;
import com.nhl.model.CustomerOrderItem;
import com.nhl.model.Product;
import com.nhl.repository.CustomerOrderItemRepository;
import com.nhl.repository.CustomerOrderRepository;
import com.nhl.repository.ProductRepository;
import com.nhl.dto.OrderItemWithProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

@Controller
public class OrderCancelledController {
    @Autowired
    private CustomerOrderRepository customerOrderRepository;
    @Autowired
    private CustomerOrderItemRepository customerOrderItemRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/admin/ordercancelled")
    public String orderCancelledPage(Model model, HttpSession session) {
        Object user = session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        // Lấy các đơn hàng bị huỷ (status = 2)
        List<CustomerOrder> customerOrders = customerOrderRepository.findByStatus(2);
        model.addAttribute("customer_orders", customerOrders);

        // Build map: orderId -> List<OrderItemWithProduct>
        Map<Long, List<OrderItemWithProduct>> orderItemsMap = new HashMap<>();
        Map<Long, Integer> orderTotalMap = new HashMap<>(); // orderId -> tổng tiền
        for (CustomerOrder order : customerOrders) {
            List<CustomerOrderItem> items = customerOrderItemRepository.findAll()
                .stream().filter(i -> i.getOrderId().equals(order.getId())).toList();
            List<OrderItemWithProduct> itemWithProducts = new ArrayList<>();
            int total = 0;
            for (CustomerOrderItem item : items) {
                Product product = productRepository.findById(item.getProductId()).orElse(null);
                if (product != null) {
                    int unitPrice = item.getPrice();
                    int itemTotal = unitPrice * item.getQuantity();
                    itemWithProducts.add(new OrderItemWithProduct(
                        product.getName(),
                        item.getQuantity(),
                        itemTotal, // price = thành tiền
                        unitPrice, // unitPrice
                        product.getImage()
                    ));
                    total += itemTotal;
                }
            }
            orderItemsMap.put(order.getId(), itemWithProducts);
            orderTotalMap.put(order.getId(), total);
        }
        model.addAttribute("order_items_map", orderItemsMap);
        model.addAttribute("order_total_map", orderTotalMap);
        model.addAttribute("activePage", "ordercancelled");
        return "web/back/ordercancelled";
    }

    @PostMapping("/admin/delete-order-cancelled")
    @ResponseBody
    public String deleteOrderCancelled(@RequestParam("orderId") Long orderId) {
        try {
            customerOrderRepository.deleteById(orderId);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
} 