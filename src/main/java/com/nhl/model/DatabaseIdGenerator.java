package com.nhl.model;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class DatabaseIdGenerator implements IdentifierGenerator {
    
    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        try {
            // Query to get the next available ID
            String sql = "SELECT COALESCE(MAX(id), 0) + 1 FROM users";
            Object result = session.createNativeQuery(sql, Long.class).uniqueResult();
            return (Long) result;
        } catch (Exception e) {
            // Fallback to a simple counter if the query fails
            return System.currentTimeMillis();
        }
    }
} 