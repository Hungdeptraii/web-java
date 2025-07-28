package com.nhl.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "Application is running! Database connection is working.";
    }

    @GetMapping("/health")
    @ResponseBody
    public String health() {
        return "OK";
    }
} 