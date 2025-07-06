package com.nhl.model;

import java.io.Serializable;
import java.util.*;

public class Cart implements Serializable {
    private Map<Long, CartItem> items = new HashMap<>();

    public void add(Product product) {
        Long productId = product.getId();
        if (items.containsKey(productId)) {
            items.get(productId).increaseQuantity();
        } else {
            items.put(productId, new CartItem(product, 1));
        }
    }

    public void remove(Long productId) {
        items.remove(productId);
    }

    public void clear() {
        items.clear();
    }

    public void update(Long productId, int quantity) {
        if (items.containsKey(productId)) {
            if (quantity <= 0) {
                items.remove(productId);
            } else {
                items.get(productId).setQuantity(quantity);
            }
        }
    }

    public Map<Long, CartItem> getItems() {
        return items;
    }

    public Collection<CartItem> getItemList() {
        return items.values();
    }

    public int getTotalQuantity() {
        return items.values().stream().mapToInt(CartItem::getQuantity).sum();
    }

    public double getTotalPrice() {
        return items.values().stream()
                .mapToDouble(i -> i.getProduct().getPrice() * i.getQuantity())
                .sum();
    }
}
