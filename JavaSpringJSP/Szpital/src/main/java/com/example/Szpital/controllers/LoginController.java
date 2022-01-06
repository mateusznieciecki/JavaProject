package com.example.Szpital.controllers;

import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/api/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private PageController pageController;

    @GetMapping(value = "/index")
    public String showLoginPage(ModelMap model) {
        model.put("myMessage", "helo");
        return pageController.getIndexPage();
    }

    @PostMapping(value = "/login")
    public String login(HttpServletRequest request, ModelMap model, @RequestParam String login, @RequestParam String haslo) {

        Pracownicy pracownik = loginService.login(login, haslo);

        if (pracownik == null) {
            model.put("errorMessage", "True");
            return pageController.getIndexPage();
        }

        request.getSession().setAttribute("pracownik", pracownik);

        if (pracownik.getTypPrac().equals("rejestrator")) {
            return pageController.szpital();
        } else if (pracownik.getTypPrac().equals("lekarz")) {
            return "panel";
        }
        return "admin";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("pracownik");

        return pageController.getIndexPage();
    }

}

