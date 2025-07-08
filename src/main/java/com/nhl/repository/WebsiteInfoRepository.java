package com.nhl.repository;

import com.nhl.model.WebsiteInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WebsiteInfoRepository extends JpaRepository<WebsiteInfo, Long> {
    // Truy vấn theo danh sách name
    List<WebsiteInfo> findByNameIn(List<String> names);

    // Truy vấn theo name duy nhất
    Optional<WebsiteInfo> findByName(String name);
}
