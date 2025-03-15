package com.pdf.pdf.splitter.service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pdf/splitter/service")
public class PdfSplitterServiceController {

    @GetMapping("/test")
    public String test() {
        return "Hello from PdfSplitterService!";
    }
}
