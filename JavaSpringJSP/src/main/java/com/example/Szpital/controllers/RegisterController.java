package com.example.Szpital.controllers;

import com.example.Szpital.entities.Pacjenci;
import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.services.RegisterService;
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
@RequestMapping("/api/register")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @Autowired
    private PageController pageController;

    @PostMapping(value = "/zarejestruj")
    public String findByNameOrPesel(HttpServletRequest request, ModelMap model, @RequestParam(required = false) Long pesel, @RequestParam(required = false) String nazwisko) {
        List<Pacjenci> pacjentList = registerService.findPacjent(pesel, nazwisko);
        List<Pracownicy> lekarzeList = registerService.findLekarze();
        model.put("lekarzeList", lekarzeList);
        if (pacjentList == null || pacjentList.size() == 0) {
            model.put("peselPacjenta", pesel);
            model.put("nazwiskoPacjenta", nazwisko);
            return "zarejestruj";
        }
        model.put("pacjenciList", pacjentList);
        return "szukaj";
    }

    @PostMapping(value = "/oswiadczenie")
    public String printDocument(HttpServletRequest request, ModelMap model, @RequestParam int id) {
        Pacjenci pacjent = registerService.findPacjent(id);
        model.put("imiePacjenta", pacjent.getImie());
        model.put("nazwiskoPacjenta", pacjent.getNazwisko());
        return "oswiadczenie";
    }

    @PostMapping(value = "/updateLekarz")
    public String updateLekarz(HttpServletRequest request, ModelMap model, @RequestParam String lekProwP, @RequestParam int id) {
        registerService.updatePacjent(lekProwP, id);
        return pageController.getSzpitalPage();
    }

    @GetMapping(value = "/deletePacjent")
    public String deletePacjent(HttpServletRequest request, ModelMap model, @RequestParam int id) {
        registerService.deletePacjent(id);
        return pageController.getSzpitalPage();
    }

    @PostMapping(value = "/addPacjent")
    public String addPacjent(HttpServletRequest request, ModelMap model, @RequestParam Long peselP, @RequestParam String imieP, @RequestParam String nazwiskoP, @RequestParam String dataP, @RequestParam String lekProwP, @RequestParam String ubezpieczenieP, @RequestParam String stanP) {
        Date dataUr = null;
        Date dataUb = null;

        try {
            dataUr = new SimpleDateFormat("yyyy-MM-dd").parse(dataP);
            dataUb = new SimpleDateFormat("yyyy-MM-dd").parse(ubezpieczenieP);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        registerService.addPacjent(peselP, imieP, nazwiskoP, dataUr, lekProwP, dataUb, stanP);
        return pageController.getSzpitalPage();
    }
}
