package com.nhl.service;

import com.nhl.model.WebsiteInfo;
import com.nhl.repository.WebsiteInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class WebsiteInfoService {

    @Autowired
    private WebsiteInfoRepository websiteInfoRepository;

    public List<WebsiteInfo> getAllSetting() {
        return websiteInfoRepository.findAll();
    }

    public Map<String, String> getPaySetting() {
        List<String> names = List.of("Tên tài khoản", "Số tài khoản", "Tên ngân hàng", "Chi nhánh", "Số ngân hàng");
        List<WebsiteInfo> settings = websiteInfoRepository.findByNameIn(names);

        return settings.stream()
                .collect(Collectors.toMap(WebsiteInfo::getName, WebsiteInfo::getValue));
    }

    public List<WebsiteInfo> getInfoWebsiteSettings() {
        List<String> names = List.of(
                "Địa chỉ",
                "Số điện thoại",
                "Địa chỉ email",
                "Mô tả",
                "Tên cửa hàng",
                "Mật khẩu wifi",
                "Logo"
        );
        return websiteInfoRepository.findByNameIn(names);
    }

    // Nếu muốn trả về Map<name, value>:
    public Map<String, String> getInfoWebsiteMap() {
        List<WebsiteInfo> settings = getInfoWebsiteSettings();
        return settings.stream()
                .collect(Collectors.toMap(WebsiteInfo::getName, WebsiteInfo::getValue));
    }

    public String getInfoWebsiteByName(String name) {
        return websiteInfoRepository.findByName(name)
                .map(WebsiteInfo::getValue)
                .orElse(null);
    }
}
