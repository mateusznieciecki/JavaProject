package com.example.Szpital.controllers;

import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.entities.Przypomnienia;
import com.example.Szpital.services.AdminService;
import com.example.Szpital.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private PageController pageController;

    @Autowired
    private LoginService loginService;

    @PostMapping("/reminders/add")
    public String addReminder(HttpServletRequest request, ModelMap model, @RequestParam String content, @RequestParam String reminderDate) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }

        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(reminderDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        adminService.addReminder(content, date);
        model.put("message", "Dodano przypomnienie");
        return pageController.getAdminPage(request, model);
    }

    @GetMapping("/reminders/remove")
    public String removeReminder(HttpServletRequest request, ModelMap model, @RequestParam int reminderId) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.removeReminder(reminderId);
        model.put("message", "Usunięto przypomnienie");
        return pageController.getAdminPage(request, model);
    }

    @GetMapping(value = "/users/remove")
    public String removeUser(HttpServletRequest request, ModelMap model, @RequestParam int userId) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.removeUser(userId);
        model.put("message", "Usunięto użytkownika");
        return pageController.getAdminUsersPage(request, model);
    }

    @PostMapping(value = "/users/add")
    public String addUser(HttpServletRequest request, ModelMap model, @RequestParam String userLogin, @RequestParam String userName, @RequestParam String userSurname, @RequestParam String userType) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.addUser(userLogin, userName, userSurname, userType);
        model.put("message", "Dodano użytkownika");
        return pageController.getAdminUsersPage(request, model);
    }

    @GetMapping(value = "/users/password/reset")
    public String resetUsersPassword(HttpServletRequest request, ModelMap model, @RequestParam int userId) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.resetUsersPassword(userId);
        model.put("message", "Zresetowano hasło");
        return pageController.getAdminUsersPage(request, model);
    }

    @PostMapping(value = "/users/edit")
    public String editUser(HttpServletRequest request, ModelMap model, @RequestParam int userId, @RequestParam String userName, @RequestParam String userSurname, @RequestParam String userType) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.editUser(userId, userName, userSurname, userType);
        model.put("message", "Zmodyfikowano użytkownika");
        return pageController.getAdminUsersPage(request, model);
    }

    @GetMapping(value = "/icd/remove")
    public String removeIcd(HttpServletRequest request, ModelMap model, @RequestParam int icdId) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.removeIcd(icdId);
        model.put("message", "Usunięto ICD");
        return pageController.getIcdPage(request, model, null);
    }

    @PostMapping(value = "/icd/edit")
    public String editIcd(HttpServletRequest request, ModelMap model, @RequestParam int icdId, @RequestParam String icd, @RequestParam String description) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.editIcd(icdId, icd, description);
        model.put("message", "Zmodyfikowano ICD");
        return pageController.getIcdPage(request, model, null);
    }

    @PostMapping(value = "/icd/add")
    public String addIcd(HttpServletRequest request, ModelMap model, @RequestParam String icd, @RequestParam String description){
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.addIcd(icd, description);
        model.put("message", "Dodano użytkownika");
        return pageController.getIcdPage(request, model, null);
    }

    @PostMapping("/medicines/add")
    public String addMedicine(HttpServletRequest request, ModelMap model, @RequestParam String medicine, @RequestParam int amount){
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return pageController.getIndexPage(request, model);
        }
        adminService.addMedicine(medicine, amount);
        model.put("message", "Dodano leki");
        return pageController.getMedicinesPage(request, model, null);
    }

}