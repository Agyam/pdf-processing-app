package com.pdf.pdf.encryption.service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pdf/encryption/service")
public class PdfEncryptionServiceController {

    @GetMapping("/test")
    public String test() {
        return "Hello from PdfEncryptionService!";
    }
}
