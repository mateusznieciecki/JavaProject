package com.example.Szpital.controllers;

import com.example.Szpital.entities.HistoriaChorob;
import com.example.Szpital.entities.Pacjenci;
import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.entities.Rozpoznanie;
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
@RequestMapping("/api/medicalCare")
public class MedicalCareController {

    @Autowired
    private PageController pageController;

    @Autowired
    private MedicalCareService medicalCareService;

    @GetMapping(value = "/patientDetails")
    public String openPatientDetails(HttpServletRequest request, ModelMap model, @RequestParam int id) {
        Pacjenci patient = medicalCareService.findPatient(id);
        model.put("patient", patient);

        List<HistoriaChorob> listOfPatientsHistory = medicalCareService.findPatientsHistory(patient.getPesel(), 2);
        model.put("listOfPatientsHistory", listOfPatientsHistory);

        List<Rozpoznanie> listOfIcd = medicalCareService.getListOfIcd(null);
        model.put("listOfIcd", listOfIcd);
        request.getSession().setAttribute("patient", patient);
        return pageController.getPatientPage();
    }

    @PostMapping(value = "/getPatientsHistory")
    public void getHistoryWithLimit(HttpServletRequest request, ModelMap model, @RequestParam int id, @RequestParam int limit) {
        Pacjenci patient = medicalCareService.findPatient(id);
        model.put("patient", patient);
        request.getSession().setAttribute("patient", patient);
        List<HistoriaChorob> listOfPatientsHistory = medicalCareService.findPatientsHistory(patient.getPesel(), limit);
        model.put("listOfPatientsHistory", listOfPatientsHistory);
    }

    @PostMapping(value = "/morePatientHistory")
    public String morePatientHistory(HttpServletRequest request, ModelMap model, @RequestParam int limit) {
        Pacjenci patientH = medicalCareService.findPatient(((Pacjenci) request.getSession().getAttribute("patient")).getId());
//        Pacjenci patientH = medicalCareService.findPatient(((Pacjenci)request.getAttribute("patient")).getId());
        model.put("patientH", patientH);

        List<HistoriaChorob> listOfPatientsHistory = medicalCareService.findPatientsHistory(patientH.getPesel(), limit);
        model.put("listOfPatientsHistory", listOfPatientsHistory);
        return pageController.getMorePatientHistoryPage();
    }

    @PostMapping(value = "/putDiagnosis")
    public String putDiagnosis(HttpServletRequest request, ModelMap model, @RequestParam String icdChoice, @RequestParam String diagnosis, @RequestParam Long pesel) {
        medicalCareService.putDiagnosis(icdChoice, diagnosis, pesel);
        medicalCareService.removePatientsDoctor(pesel);

        return pageController.getDoctorPage(request, model);
    }

    @PostMapping(value = "/orderMedicine")
    public String orderMedicines(HttpServletRequest request, ModelMap model, @RequestParam String medicine, @RequestParam int amount) {

        int result = medicalCareService.checkTheAmountOfTheMedicine(medicine, amount);
        model.put("result", result);

        return pageController.getMedicineConfirmationPage();
    }

    @PostMapping(value = "/orderAvailable")
    public void orderAvailableMedicine(HttpServletRequest request, ModelMap model, @RequestParam String medicine, @RequestParam int amount) {
        medicalCareService.orderAvailableMedicine(medicine, amount);
    }

    @PostMapping(value = "/orderUnavailable")
    public void orderUnavailableMedicine(HttpServletRequest request, ModelMap model, @RequestParam String medicine, @RequestParam int amount){
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        String username = currentUser.getImie() + " " + currentUser.getNazwisko();
        medicalCareService.orderUnAvailableMedicine(medicine, amount, username);
    }

}
