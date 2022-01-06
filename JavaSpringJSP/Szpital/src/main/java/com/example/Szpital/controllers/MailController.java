package com.example.Szpital.controllers;

import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.entities.Wiadomosci;
import com.example.Szpital.services.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/api/mail")
public class MailController {

    @Autowired
    PageController pageController;

    @Autowired
    MailService mailService;

    @GetMapping (value = "/openMailbox")
    public String openMailbox(HttpServletRequest request, ModelMap model){
        Pracownicy currentUser = (Pracownicy)request.getSession().getAttribute("pracownik");
        List<Wiadomosci> listOfMails = mailService.showUserMails(currentUser.getLogin());
        model.put("listOfMails", listOfMails);
        return pageController.box();
    }

    @GetMapping (value = "/readMail")
    public String readMail(HttpServletRequest request, ModelMap model, @RequestParam int idWiadomosci){
        Wiadomosci mail = mailService.findMail(idWiadomosci);
        model.put("mail", mail);
        return pageController.readMail();
    }

}
