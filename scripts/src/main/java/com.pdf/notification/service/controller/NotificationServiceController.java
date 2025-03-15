package com.pdf.notification.service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/notification/service")
public class NotificationServiceController {

    @GetMapping("/test")
    public String test() {
        return "Hello from NotificationService!";
    }
}
