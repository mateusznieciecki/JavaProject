package com.example.Szpital.services;

import com.example.Szpital.entities.Pacjenci;
import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.repositories.IPacjenciRepository;
import com.example.Szpital.repositories.IPracownicyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RegisterService {
    @Autowired
    private IPacjenciRepository iPacjenciRepository;
    @Autowired
    private IPracownicyRepository iPracownicyRepository;

    public List<Pacjenci> findPacjent(Long pesel, String nazwisko) {
        List<Pacjenci> pacjentList = null;
        if (pesel != null) {
            pacjentList = iPacjenciRepository.findAllByPesel(pesel);
        } else if (nazwisko != null && !nazwisko.equals("")) {
            pacjentList = iPacjenciRepository.findAllByNazwisko(nazwisko);
        }
        return pacjentList;
    }

    public List<Pracownicy> findLekarze() {
        return iPracownicyRepository.findAllByTypPrac("lekarz");
    }

    public Pacjenci findPacjent(int id) {
        return iPacjenciRepository.findById(id).orElse(null);
    }

    public void updatePacjent(String lekProwP, int id){
        Pacjenci pacjent = iPacjenciRepository.findById(id).orElse(null);
        if(pacjent != null){
            pacjent.setLekProw(lekProwP);
            iPacjenciRepository.save(pacjent);
        }
    }

    public void deletePacjent(int id){
        Pacjenci pacjent = iPacjenciRepository.findById(id).orElse(null);
        if(pacjent != null){
            iPacjenciRepository.delete(pacjent);
        }
    }

    public void addPacjent(long peselP, String imieP, String nazwiskoP, Date dataP, String lekProwP, Date ubezpieczenieP, String stanP){
        Pacjenci pacjent = new Pacjenci(peselP, imieP, nazwiskoP, dataP, lekProwP, ubezpieczenieP, stanP);
        iPacjenciRepository.save(pacjent);
    }
}

