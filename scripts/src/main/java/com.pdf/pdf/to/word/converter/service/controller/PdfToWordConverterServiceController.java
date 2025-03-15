package com.pdf.pdf.to.word.converter.service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pdf/to/word/converter/service")
public class PdfToWordConverterServiceController {

    @GetMapping("/test")
    public String test() {
        return "Hello from PdfToWordConverterService!";
    }
}
