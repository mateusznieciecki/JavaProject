package com.example.Szpital.controllers;

import com.example.Szpital.entities.*;
import com.example.Szpital.services.AdminService;
import com.example.Szpital.services.ForumService;
import com.example.Szpital.services.LoginService;
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

    @Autowired
    private LoginService loginService;

    @GetMapping(value = "/szpital")
    public String getSzpitalPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "rejestrator")){
            return getIndexPage(request, model);
        }
        return "szpital";
    }

    @GetMapping(value = "/box")
    public String getMailboxPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "all")){
            return getIndexPage(request, model);
        }
        return "mailbox";
    }

    @GetMapping(value = "/box/read")
    public String getReadMailPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "all")){
            return getIndexPage(request, model);
        }
        return "readMail";
    }

    @GetMapping(value = "/box/sent")
    public String getSentMailboxPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "all")){
            return getIndexPage(request, model);
        }
        return "sent";
    }

    @GetMapping(value = "/box/send")
    public String getSendMailPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "all")){
            return getIndexPage(request, model);
        }
        return "sendMail";
    }

    @GetMapping(value = "/index")
    public String getIndexPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(user != null){
            if (user.getTypPrac().equals("rejestrator")) {
                return getSzpitalPage(request, model);
            } else if (user.getTypPrac().equals("lekarz")) {
                return getDoctorPage(request, model);
            }
            return getAdminPage(request, model);
        }
        return "index";
    }

    @GetMapping(value = "/doctor")
    public String getDoctorPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        String doctorNameAndSurname = currentUser.getImie() + " " + currentUser.getNazwisko();

        List<Pacjenci> listOfDoctorsPatients = medicalCareService.findAllDoctorsPatients(doctorNameAndSurname);
        model.put("listOfDoctorsPatients", listOfDoctorsPatients);

        return "doctor";
    }

    @GetMapping(value = "/admin/panel")
    public String getAdminPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        List<Przypomnienia> listOfReminders = adminService.getAllReminders();
        model.put("listOfReminders", listOfReminders);

        return "admin";
    }

    @GetMapping(value = "/admin/users")
    public String getAdminUsersPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        List<Pracownicy> listOfUsers = adminService.getAllUsers();
        model.put("listOfUsers", listOfUsers);

        return "users";
    }

    @GetMapping(value = "/admin/users/edit")
    public String getEditUserPage(HttpServletRequest request, ModelMap model, @RequestParam int userId) {
        Pracownicy userCheck = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(userCheck, "admin")){
            return getIndexPage(request, model);
        }
        Pracownicy user = adminService.getUser(userId);
        model.put("user", user);

        return "editUser";
    }

    @GetMapping(value = "/patient")
    public String getPatientPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        return "patient";
    }

    @GetMapping(value = "/morePatientHistory")
    public String getMorePatientHistoryPage() {
        return "morePatientHistory";
    }

    @GetMapping(value = "/orderMedicines")
    public String getOrderMedicinesPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        List<Leki> listOfMedicines = medicalCareService.getAllMedicines(null);
        model.put("listOfMedicines", listOfMedicines);

        return "orderMedicines";
    }

    @GetMapping(value = "/medicineConfirmation")
    public String getMedicineConfirmationPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        return "medicineConfirmation";
    }

    @GetMapping(value = "/forum")
    public String getForumPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        List<Wpisy> listOfTopics = forumService.getAllTopics();
        model.put("listOfTopics", listOfTopics);

        return "forum";
    }

    @GetMapping(value = "/loadTopic")
    public String getLoadTopicPage(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        return "loadTopic";
    }

    @PostMapping(value = "/topic/add")
    public String getAddTopic(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "lekarz")){
            return getIndexPage(request, model);
        }
        return "addTopic";
    }

    @GetMapping("/icd")
    public String getIcdPage(HttpServletRequest request, ModelMap model, @RequestParam(required = false) Integer sortOption) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        List<Rozpoznanie> listOfIcd = medicalCareService.getListOfIcd(sortOption);
        model.put("listOfIcd", listOfIcd);

        return "icd";
    }

    @PostMapping("/icd/search")
    public String searchSpecificIcd(HttpServletRequest request, ModelMap model, @RequestParam String searchValue) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        List<Rozpoznanie> listOfIcd = medicalCareService.searchSpecificIcd(searchValue);
        model.put("listOfIcd", listOfIcd);

        return "icd";
    }

    @GetMapping("/icd/edit")
    public String getEditIcdPage(HttpServletRequest request, ModelMap model, @RequestParam int icdId) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        Rozpoznanie diagnosis = medicalCareService.findIcd(icdId);
        model.put("diagnosis", diagnosis);

        return "editIcd";
    }

    @GetMapping("/medicines")
    public String getMedicinesPage(HttpServletRequest request, ModelMap model, @RequestParam(required = false) Integer sortOption) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        List<Leki> listOfMedicines = medicalCareService.getAllMedicines(sortOption);
        model.put("listOfMedicines", listOfMedicines);

        List<ZamowieniaLekow> listOfOrderedMedicines = medicalCareService.findAllOrderedMedicines();
        model.put("listOfOrderedMedicines", listOfOrderedMedicines);

        return "addMedicines";
    }

    @PostMapping("/medicines/search")
    public String searchSpecificMedicines(HttpServletRequest request, ModelMap model, @RequestParam String searchValue){
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if(!loginService.checkAccessRights(user, "admin")){
            return getIndexPage(request, model);
        }
        List<Leki> listOfMedicines = medicalCareService.searchSpecificMedicines(searchValue);
        model.put("listOfMedicines", listOfMedicines);

        List<ZamowieniaLekow> listOfOrderedMedicines = medicalCareService.findAllOrderedMedicines();
        model.put("listOfOrderedMedicines", listOfOrderedMedicines);
        return "addMedicines";
    }

}
