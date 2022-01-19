package com.example.Szpital.services;

import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.repositories.IPracownicyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private IPracownicyRepository iPracownicyRepository;

    public Pracownicy login(String login, String haslo) {
        Pracownicy pracownik = iPracownicyRepository.findByLogin(login);
        if (pracownik != null) {
            if (pracownik.getHaslo().equals(haslo)) {
                return pracownik;
            }
        }
        return null;
    }

    public boolean checkAccessRights(Pracownicy user, String level) {
        if (user != null) {
            return user.getTypPrac().equals(level) || level.equals("all");
        }

        return false;
    }

}
