package com.example.Szpital.controllers;

import com.example.Szpital.entities.*;
import com.example.Szpital.services.AdminService;
import com.example.Szpital.services.ForumService;
import com.example.Szpital.services.MedicalCareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/api/page")
public class PageController {

    @Autowired
    private MedicalCareService medicalCareService;

    @Autowired
    private ForumService forumService;

    @Autowired
    private AdminService adminService;

    @GetMapping(value = "/szpital")
    public String getSzpitalPage() {
        return "szpital";
    }

    @GetMapping(value = "/box")
    public String getMailboxPage() {
        return "mailbox";
    }

    @GetMapping(value = "/box/read")
    public String getReadMailPage() {
        return "readMail";
    }

    @GetMapping(value = "/box/sent")
    public String getSentMailboxPage() {
        return "sent";
    }

    @GetMapping(value = "/box/send")
    public String getSendMailPage() {
        return "sendMail";
    }

    @GetMapping(value = "/index")
    public String getIndexPage() {
        return "index";
    }

    @GetMapping(value = "/doctor")
    public String getDoctorPage(HttpServletRequest request, ModelMap model) {
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        String doctorNameAndSurname = currentUser.getImie() + " " + currentUser.getNazwisko();

        List<Pacjenci> listOfDoctorsPatients = medicalCareService.findAllDoctorsPatients(doctorNameAndSurname);
        model.put("listOfDoctorsPatients", listOfDoctorsPatients);

        return "doctor";
    }

    @GetMapping(value = "/admin/panel")
    public String getAdminPage(HttpServletRequest request, ModelMap model) {
        List<Przypomnienia> listOfReminders = adminService.getAllReminders();
        model.put("listOfReminders", listOfReminders);

        return "admin";
    }

    @GetMapping(value = "/admin/users")
    public String getAdminUsersPage(HttpServletRequest request, ModelMap model) {
        List<Pracownicy> listOfUsers = adminService.getAllUsers();
        model.put("listOfUsers", listOfUsers);

        return "users";
    }

    @GetMapping(value = "/admin/users/edit")
    public String getEditUserPage(HttpServletRequest request, ModelMap model, @RequestParam int userId) {
        Pracownicy user = adminService.getUser(userId);
        model.put("user", user);

        return "editUser";
    }

    @GetMapping(value = "/patient")
    public String getPatientPage() {
        return "patient";
    }

    @GetMapping(value = "/morePatientHistory")
    public String getMorePatientHistoryPage() {
        return "morePatientHistory";
    }

    @GetMapping(value = "/orderMedicines")
    public String getOrderMedicinesPage(HttpServletRequest request, ModelMap modelMap) {
        List<Leki> listOfMedicines = medicalCareService.getAllMedicines();
        modelMap.put("listOfMedicines", listOfMedicines);

        return "orderMedicines";
    }

    @GetMapping(value = "/medicineConfirmation")
    public String getMedicineConfirmationPage() {
        return "medicineConfirmation";
    }

    @GetMapping(value = "/forum")
    public String getForumPage(HttpServletRequest request, ModelMap model) {
        List<Wpisy> listOfTopics = forumService.getAllTopics();
        model.put("listOfTopics", listOfTopics);

        return "forum";
    }

    @GetMapping(value = "/loadTopic")
    public String getLoadTopicPage() {
        return "loadTopic";
    }

    @PostMapping(value = "/topic/add")
    public String getAddTopic() {
        return "addTopic";
    }

    @GetMapping("/icd")
    public String getIcdPage(HttpServletRequest request, ModelMap model) {
        List<Rozpoznanie> listOfIcd = medicalCareService.getListOfIcd();
        model.put("listOfIcd", listOfIcd);

        return "icd";
    }

    @GetMapping("/icd/edit")
    public String getEditIcdPage(HttpServletRequest request, ModelMap model, @RequestParam int icdId) {
        Rozpoznanie diagnosis = medicalCareService.findIcd(icdId);
        model.put("diagnosis", diagnosis);

        return "editIcd";
    }
}
