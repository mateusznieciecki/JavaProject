package com.example.Szpital.controllers;

import com.example.Szpital.entities.Przypomnienia;
import com.example.Szpital.services.AdminService;
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

    @PostMapping("/reminders/add")
    public String addReminder(HttpServletRequest request, ModelMap model, @RequestParam String content, @RequestParam String reminderDate) {
        Date date = null;

        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(reminderDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        adminService.addReminder(content, date);
        return pageController.getAdminPage(request, model);
    }

    @GetMapping("/reminders/remove")
    public String removeReminder(HttpServletRequest request, ModelMap model, @RequestParam int reminderId) {
        adminService.removeReminder(reminderId);
        return pageController.getAdminPage(request, model);
    }

    @GetMapping(value = "/users/remove")
    public String removeUser(HttpServletRequest request, ModelMap model, @RequestParam int userId) {
        adminService.removeUser(userId);
        return pageController.getAdminUsersPage(request, model);
    }

    @PostMapping(value = "/users/add")
    public String addUser(HttpServletRequest request, ModelMap model, @RequestParam String userLogin, @RequestParam String userName, @RequestParam String userSurname, @RequestParam String userType) {
        adminService.addUser(userLogin, userName, userSurname, userType);
        return pageController.getAdminUsersPage(request, model);
    }

    @GetMapping(value = "/users/password/reset")
    public String resetUsersPassword(HttpServletRequest request, ModelMap model, @RequestParam int userId) {
        adminService.resetUsersPassword(userId);
        return pageController.getAdminUsersPage(request, model);
    }

    @PostMapping(value = "/users/edit")
    public String editUser(HttpServletRequest request, ModelMap model, @RequestParam int userId, @RequestParam String userName, @RequestParam String userSurname, @RequestParam String userType) {
        adminService.editUser(userId, userName, userSurname, userType);
        return pageController.getAdminUsersPage(request, model);
    }

    @GetMapping(value = "/icd/remove")
    public String removeIcd(HttpServletRequest request, ModelMap model, @RequestParam int icdId) {
        adminService.removeIcd(icdId);
        return pageController.getIcdPage(request, model);
    }

    @PostMapping(value = "/icd/edit")
    public String editIcd(HttpServletRequest request, ModelMap model, @RequestParam int icdId, @RequestParam String icd, @RequestParam String description) {
        adminService.editIcd(icdId, icd, description);
        return pageController.getIcdPage(request, model);
    }

    @PostMapping(value = "/icd/add")
    public String addIcd(HttpServletRequest request, ModelMap model, @RequestParam String icd, @RequestParam String description){
        adminService.addIcd(icd, description);
        return pageController.getIcdPage(request, model);
    }

}
