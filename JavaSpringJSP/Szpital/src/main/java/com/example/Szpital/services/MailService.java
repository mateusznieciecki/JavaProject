package com.example.Szpital.services;

import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.entities.Wiadomosci;
import com.example.Szpital.repositories.IPracownicyRepository;
import com.example.Szpital.repositories.IWiadomosciRepository;
import org.aspectj.bridge.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MailService {

    @Autowired
    private IWiadomosciRepository iWiadomosciRepository;

    @Autowired
    private IPracownicyRepository iPracownicyRepository;

    public List<Wiadomosci> showUserMails(String login) {
        List<Wiadomosci> listOfMails = iWiadomosciRepository.findAllByDoKogo(login);
        listOfMails = listOfMails.stream()
                .sorted(Comparator.comparingInt(Wiadomosci::getIdWiadomosci).reversed())
                .collect(Collectors.toList());
        return listOfMails;
    }

    public Wiadomosci findMail(int idWiadomosci, String login) {
        Wiadomosci mail = iWiadomosciRepository.findById(idWiadomosci).orElse(null);
        if (mail != null && mail.getStatus() == 0 && mail.getDoKogo().equals(login)) {
            mail.setStatus(1);
            iWiadomosciRepository.save(mail);
        }
        return mail;
    }

    public List<Wiadomosci> findAllMailsSentByUser(String login) {

        return iWiadomosciRepository.findAllByOd(login)
                .stream()
                .sorted(Comparator.comparingInt(Wiadomosci::getIdWiadomosci).reversed())
                .toList();
    }

    public List<Pracownicy> findAllWorkers() {
        return iPracownicyRepository.findAll();
    }

    public void sendMail(String from, String toWhom, String topic, String message) {
        Wiadomosci mail = new Wiadomosci(topic, message, from, toWhom);
        iWiadomosciRepository.save(mail);
    }

}
