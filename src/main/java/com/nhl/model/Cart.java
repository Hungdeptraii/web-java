package com.nhl.model;

import java.io.Serializable;
import java.util.*;

public class Cart implements Serializable {
    private Map<Long, CartItem> items = new HashMap<>();

    public void add(Product product) {
        if (product == null) return;
        Long id = product.getId();
        if (items.containsKey(id)) {
            items.get(id).increaseQuantity();
        } else {
            items.put(id, new CartItem(product, 1));
        }
    }

    public void clear() {
        items.clear();
    }

    public void remove(Long productId) {
        items.remove(productId);
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

    public long getTotalPrice() {
        return items.values().stream()
                .mapToLong(i -> (long) i.getProduct().getPrice() * i.getQuantity())
                .sum();
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
}
