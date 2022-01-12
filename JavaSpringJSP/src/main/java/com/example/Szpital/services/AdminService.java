package com.example.Szpital.services;

import com.example.Szpital.entities.*;
import com.example.Szpital.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AdminService {

    @Autowired
    private IPrzypomnieniaRepository iPrzypomnieniaRepository;

    @Autowired
    private IPracownicyRepository iPracownicyRepository;

    @Autowired
    private IRozpoznanieRepository iRozpoznanieRepository;

    @Autowired
    private IZamowieniaLekowRepository iZamowieniaLekowRepository;

    @Autowired
    private ILekiRepository iLekiRepository;

    public List<Przypomnienia> getAllReminders() {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String today = formatter.format(date);

        return iPrzypomnieniaRepository.findAll()
                .stream()
                .filter(reminder -> formatter.format(reminder.getDataPrzypomnienia()).equals(today))
                .collect(Collectors.toList());
    }

    public void addReminder(String content, Date reminderDate) {
        Przypomnienia reminder = new Przypomnienia(reminderDate, content);
        iPrzypomnieniaRepository.save(reminder);
    }

    public void removeReminder(int reminderId) {
        Przypomnienia reminder = iPrzypomnieniaRepository.findById(reminderId).orElse(null);
        if (reminder != null) {
            iPrzypomnieniaRepository.delete(reminder);
        }
    }

    public List<Pracownicy> getAllUsers() {
        return iPracownicyRepository.findAll();
    }

    public void removeUser(int userId) {
        Pracownicy user = iPracownicyRepository.findById(userId).orElse(null);
        if (user != null) {
            iPracownicyRepository.delete(user);
        }
    }

    public void addUser(String login, String firstname, String lastname, String usertype) {
        Pracownicy user = new Pracownicy(login, firstname, lastname, usertype);
        iPracownicyRepository.save(user);
    }

    public void resetUsersPassword(int userId) {
        Pracownicy user = iPracownicyRepository.findById(userId).orElse(null);
        if (user != null) {
            user.setHaslo(user.getLogin());
            iPracownicyRepository.save(user);
        }
    }

    public Pracownicy getUser(int userId) {
        return iPracownicyRepository.findById(userId).orElse(null);
    }

    public void editUser(int userId, String firstname, String lastname, String usertype) {
        Pracownicy user = iPracownicyRepository.findById(userId).orElse(null);
        if (user != null) {
            user.setImie(firstname);
            user.setNazwisko(lastname);
            user.setTypPrac(usertype);
            iPracownicyRepository.save(user);
        }
    }

    public void removeIcd(int icdId) {
        Rozpoznanie diagnosis = iRozpoznanieRepository.findById(icdId).orElse(null);
        if (diagnosis != null) {
            iRozpoznanieRepository.delete(diagnosis);
        }
    }

    public void editIcd(int icdId, String icd, String description) {
        Rozpoznanie diagnosis = iRozpoznanieRepository.findById(icdId).orElse(null);
        if (diagnosis != null) {
            diagnosis.setIcd(icd);
            diagnosis.setOpis(description);
            iRozpoznanieRepository.save(diagnosis);
        }
    }

    public void addIcd(String icd, String description) {
        Rozpoznanie diagnosis = new Rozpoznanie(icd, description);
        iRozpoznanieRepository.save(diagnosis);
    }

    public void addMedicine(String name, int amount) {
        Leki medicine = iLekiRepository.findByNazwa(name);
        if (medicine != null) {
            medicine.setIlosc(medicine.getIlosc() + amount);
        } else {
            medicine = new Leki(name, amount);
        }

        List<ZamowieniaLekow> listOfOrders = iZamowieniaLekowRepository.findAllByLekAndStatus(name ,0);
        for (ZamowieniaLekow order : listOfOrders) {
            if (order.getIloscLeku() < medicine.getIlosc()) {
                medicine.setIlosc(medicine.getIlosc() - order.getIloscLeku());
                order.setStatus(1);
                iZamowieniaLekowRepository.save(order);
            }
        }

        iLekiRepository.save(medicine);

    }

}
