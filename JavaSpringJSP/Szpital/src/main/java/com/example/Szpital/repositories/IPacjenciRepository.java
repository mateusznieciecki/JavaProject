package com.example.Szpital.repositories;

import com.example.Szpital.entities.Pacjenci;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPacjenciRepository extends JpaRepository<Pacjenci, Integer> {
    List<Pacjenci> findAllByPesel(long pesel);
    List<Pacjenci> findAllByNazwisko(String nazwisko);
}
