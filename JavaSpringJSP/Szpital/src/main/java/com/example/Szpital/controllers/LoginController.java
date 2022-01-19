package com.example.Szpital.controllers;

import com.example.Szpital.entities.Pacjenci;
import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.services.LoginService;
import com.example.Szpital.services.MedicalCareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/api/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private PageController pageController;

    @Autowired
    private MedicalCareService medicalCareService;

    @GetMapping(value = "/index")
    public String showLoginPage(HttpServletRequest request, ModelMap model) {
        return pageController.getIndexPage(request, model);
    }

    @PostMapping(value = "/login")
    public String login(HttpServletRequest request, ModelMap model, @RequestParam String login, @RequestParam String haslo) {
        Pracownicy pracownik = loginService.login(login, haslo);

        if (pracownik == null) {
            model.put("errorMessage", "True");
            return pageController.getIndexPage(request, model);
        }

        request.getSession().setAttribute("pracownik", pracownik);

        if (pracownik.getTypPrac().equals("rejestrator")) {
            return pageController.getSzpitalPage(request, model);
        } else if (pracownik.getTypPrac().equals("lekarz")) {
            return pageController.getDoctorPage(request, model);
        }
        return pageController.getAdminPage(request, model);
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "all")){
            return pageController.getIndexPage(request, model);
        }

        request.getSession().removeAttribute("pracownik");

        return pageController.getIndexPage(request, model);
    }

}

