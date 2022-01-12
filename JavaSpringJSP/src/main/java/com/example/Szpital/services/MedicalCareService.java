package com.example.Szpital.services;

import com.example.Szpital.entities.*;
import com.example.Szpital.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicalCareService {

    @Autowired
    private IPacjenciRepository iPacjenciRepository;

    @Autowired
    private IHistoriaChorobRepository iHistoriaChorobRepository;

    @Autowired
    private IRozpoznanieRepository iRozpoznanieRepository;

    @Autowired
    private ILekiRepository iLekiRepository;

    @Autowired
    private IZamowieniaLekowRepository iZamowieniaLekowRepository;

    public List<Pacjenci> findAllDoctorsPatients(String doctorNameAndSurname) {
        return iPacjenciRepository.findAllByLekProw(doctorNameAndSurname);
    }

    public Pacjenci findPatient(int id) {
        return iPacjenciRepository.findById(id).orElse(null);
    }

    public List<HistoriaChorob> findPatientsHistory(Long pesel, int limit) {
        return iHistoriaChorobRepository.findByPeselWithLimit(pesel, limit);
    }

    public List<Rozpoznanie> getListOfIcd(Integer sortOption) {
        List<Rozpoznanie> listOfIcd;
        if (sortOption == null) {
            listOfIcd = iRozpoznanieRepository.findAll();
        } else if (sortOption == 1) {
            listOfIcd = iRozpoznanieRepository.findAllByOrderByIcdAsc();
        } else if (sortOption == 2) {
            listOfIcd = iRozpoznanieRepository.findAllByOrderByIcdDesc();
        } else if (sortOption == 3) {
            listOfIcd = iRozpoznanieRepository.findAllByOrderByOpisAsc();
        } else {
            listOfIcd = iRozpoznanieRepository.findAllByOrderByOpisDesc();
        }

        return listOfIcd;
    }

    public List<Rozpoznanie> searchSpecificIcd(String searchValue) {
        return iRozpoznanieRepository.findSpecificIcd(searchValue);
    }

    public void putDiagnosis(String icdChoice, String diagnosis, Long pesel) {
        HistoriaChorob disease = new HistoriaChorob(pesel, icdChoice, diagnosis);
        iHistoriaChorobRepository.save(disease);
    }

    public void removePatientsDoctor(long pesel) {
        Pacjenci patient = iPacjenciRepository.findByPesel(pesel);
        if (patient != null) {
            patient.setLekProw("");
            iPacjenciRepository.save(patient);
        }
    }

    public List<Leki> getAllMedicines(Integer sortOption) {
        List<Leki> listOfMedicines;
        if (sortOption == null) {
            listOfMedicines = iLekiRepository.findAll();
        } else if (sortOption == 1) {
            listOfMedicines = iLekiRepository.findAllByOrderByNazwaAsc();
        } else if (sortOption == 2) {
            listOfMedicines = iLekiRepository.findAllByOrderByNazwaDesc();
        } else if (sortOption == 3) {
            listOfMedicines =iLekiRepository.findAllByOrderByIloscAsc();
        } else {
            listOfMedicines = iLekiRepository.findAllByOrderByIloscDesc();
        }
        return listOfMedicines;
    }

    public int checkTheAmountOfTheMedicine(String medicineName, int amount) {
        Leki medicine = iLekiRepository.findByNazwa(medicineName);
        if (medicine != null) {
            if (medicine.getIlosc() >= amount) {
                return 1;
            }
        }
        return 0;
    }

    public void orderAvailableMedicine(String medicineName, int amount) {
        Leki medicine = iLekiRepository.findByNazwa(medicineName);
        if (medicine != null) {
            int currentAmount = medicine.getIlosc();
            medicine.setIlosc(currentAmount - amount);
            iLekiRepository.save(medicine);
        }
    }

    public void orderUnAvailableMedicine(String medicineName, int amount, String username) {
        ZamowieniaLekow order = new ZamowieniaLekow(medicineName, amount, username);
        iZamowieniaLekowRepository.save(order);
    }

    public Rozpoznanie findIcd(int icdId) {
        return iRozpoznanieRepository.findById(icdId).orElse(null);
    }

    public List<ZamowieniaLekow> findAllOrderedMedicines(){
        return iZamowieniaLekowRepository.findAllByStatus(0);
    }

    public List<Leki> searchSpecificMedicines(String searchValue){
        return iLekiRepository.findSpecificMedicines(searchValue);
    }

}
