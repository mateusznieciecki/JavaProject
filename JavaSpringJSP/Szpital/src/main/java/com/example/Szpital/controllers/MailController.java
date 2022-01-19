package com.example.Szpital.controllers;

import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.entities.Wiadomosci;
import com.example.Szpital.services.LoginService;
import com.example.Szpital.services.MailService;
import com.example.Szpital.services.RegisterService;
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
@RequestMapping("/api/mail")
public class MailController {

    @Autowired
    private PageController pageController;

    @Autowired
    private MailService mailService;

    @Autowired
    private RegisterService registerService;

    @Autowired
    private LoginService loginService;

    @GetMapping(value = "/openMailbox")
    public String openMailbox(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if (!loginService.checkAccessRights(user, "all")) {
            return pageController.getIndexPage(request, model);
        }
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        List<Wiadomosci> listOfMails = mailService.showUserMails(currentUser.getLogin());
        model.put("listOfMails", listOfMails);
        return pageController.getMailboxPage(request, model);
    }

    @GetMapping(value = "/readMail")
    public String readMail(HttpServletRequest request, ModelMap model, @RequestParam int idWiadomosci) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if (!loginService.checkAccessRights(user, "all")) {
            return pageController.getIndexPage(request, model);
        }
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        Wiadomosci mail = mailService.findMail(idWiadomosci, currentUser.getLogin());
        if (mail == null) {
            return openMailbox(request, model);
        }
        model.put("mail", mail);
        return pageController.getReadMailPage(request, model);
    }

    @GetMapping(value = "/sentMailbox")
    public String openSentMailbox(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if (!loginService.checkAccessRights(user, "all")) {
            return pageController.getIndexPage(request, model);
        }
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        List<Wiadomosci> listOfSentMails = mailService.findAllMailsSentByUser(currentUser.getLogin());
        model.put("listOfSentMails", listOfSentMails);

        return pageController.getSentMailboxPage(request, model);
    }

    @GetMapping(value = "/sendMail")
    public String openSendMail(HttpServletRequest request, ModelMap model) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if (!loginService.checkAccessRights(user, "all")) {
            return pageController.getIndexPage(request, model);
        }
        List<Pracownicy> listOfWorkers = mailService.findAllWorkers();
        model.put("listOfWorkers", listOfWorkers);

        return pageController.getSendMailPage(request, model);
    }

    @PostMapping(value = "/send")
    public String sendMail(HttpServletRequest request, ModelMap model, @RequestParam String toWhom, @RequestParam String topic, @RequestParam String message) {
        Pracownicy user = (Pracownicy) request.getSession().getAttribute("pracownik");
        if (!loginService.checkAccessRights(user, "all")) {
            return pageController.getIndexPage(request, model);
        }
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        mailService.sendMail(currentUser.getLogin(), toWhom, topic, message);
        model.put("message", "Wysłano wiadomość");
        return openMailbox(request, model);
    }

}
