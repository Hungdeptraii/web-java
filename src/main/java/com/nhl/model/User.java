package com.nhl.model;

import org.hibernate.annotations.GenericGenerator;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users") // hoặc tên bảng thực tế trong CSDL của bạn
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "custom-id")
    @GenericGenerator(name = "custom-id", strategy = "com.nhl.model.DatabaseIdGenerator")
    private Long id;

    private String email;

    private String password;

    private String avatar;

    private String fullname;

    private String rememberToken;

    private int level;

    private String phone;

    // Constructors
    public User() {
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Getters & Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRememberToken() {
        return rememberToken;
    }

    public void setRememberToken(String rememberToken) {
        this.rememberToken = rememberToken;
    }

    public int getLevel() {
        return level;
    }
    public void setLevel(int level) {
        this.level = level;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
}
