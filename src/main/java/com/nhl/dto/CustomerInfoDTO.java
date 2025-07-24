package com.nhl.dto;

public class CustomerInfoDTO {
    private String fullname;
    private String phone;
    private String address;
    private String note;
    private String code;
    private String ban;

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
} 