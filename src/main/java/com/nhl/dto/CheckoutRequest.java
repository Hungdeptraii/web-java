package com.nhl.dto;

import java.util.List;

public class CheckoutRequest {
    private CustomerInfoDTO info;
    private List<CartItemDTO> items;

    public CustomerInfoDTO getInfo() { return info; }
    public void setInfo(CustomerInfoDTO info) { this.info = info; }
    public List<CartItemDTO> getItems() { return items; }
    public void setItems(List<CartItemDTO> items) { this.items = items; }
} 