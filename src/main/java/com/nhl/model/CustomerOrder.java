package com.nhl.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "customer_orders")
public class CustomerOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullname;
    private String phone;
    private String address;
    private String note;
    private String code;
    private String ban;
    private int status = 0; // 0: chưa xác nhận, 1: đã xác nhận, 2: đã bị huỷ
    private String reason;

    @Column(name = "created_at")
    private Timestamp createdAt;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getBan() { return ban; }
    public void setBan(String ban) { this.ban = ban; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
} 