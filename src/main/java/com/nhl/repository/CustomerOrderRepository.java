package com.nhl.repository;

import com.nhl.model.CustomerOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerOrderRepository extends JpaRepository<CustomerOrder, Long> {
    java.util.List<CustomerOrder> findByStatus(int status);
} 