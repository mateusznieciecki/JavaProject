package com.example.Szpital.services;

import com.example.Szpital.entities.Wiadomosci;
import com.example.Szpital.repositories.IWiadomosciRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MailService {

    @Autowired
    private IWiadomosciRepository iWiadomosciRepository;

    public List<Wiadomosci> showUserMails(String login) {
        List<Wiadomosci> listOfMails = iWiadomosciRepository.findAllByDoKogo(login);
        listOfMails = listOfMails.stream()
                .sorted(Comparator.comparingInt(Wiadomosci::getIdWiadomosci).reversed())
                .collect(Collectors.toList());
        return listOfMails;
    }

    public Wiadomosci findMail(int idWiadomosci){
        Wiadomosci mail = iWiadomosciRepository.findById(idWiadomosci).orElse(null);
        if(mail != null && mail.getStatus() == 0){
            mail.setStatus(1);
            iWiadomosciRepository.save(mail);
        }
        return mail;
    }
}
