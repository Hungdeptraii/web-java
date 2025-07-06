package com.nhl.repository;

import com.nhl.model.WebsiteInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WebsiteInfoRepository extends JpaRepository<WebsiteInfo, Long> {
    WebsiteInfo findFirstByOrderByIdAsc(); // Lấy dòng đầu tiên
}
