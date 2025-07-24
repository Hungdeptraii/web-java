package com.nhl.dto;

public class OrderItemWithProduct {
    private String productName;
    private int quantity;
    private int price;
    private int unitPrice;
    private String image;

    public OrderItemWithProduct(String productName, int quantity, int price, int unitPrice, String image) {
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.unitPrice = unitPrice;
        this.image = image;
    }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getUnitPrice() { return unitPrice; }
    public void setUnitPrice(int unitPrice) { this.unitPrice = unitPrice; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
} 