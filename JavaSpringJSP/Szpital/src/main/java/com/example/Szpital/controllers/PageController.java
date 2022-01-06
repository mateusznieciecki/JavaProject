package com.example.Szpital.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/page")
public class PageController {

    @GetMapping(value = "/szpital")
    public String szpital() {
        return "szpital";
    }

    @GetMapping(value = "/box")
    public String box() {
        return "mailbox";
    }

    @GetMapping(value = "/box/read")
    public String readMail() {
        return "readMail";
    }

    @GetMapping(value = "/index")
    public String getIndexPage(){
        return "index";
    }

}
