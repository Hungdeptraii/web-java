package com.nhl.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhl.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    User findByPhone(String phone);
}
