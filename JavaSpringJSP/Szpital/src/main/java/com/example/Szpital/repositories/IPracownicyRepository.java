package com.example.Szpital.repositories;

import com.example.Szpital.entities.Pracownicy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPracownicyRepository extends JpaRepository<Pracownicy, Integer> {
    Pracownicy findByLogin(String login);
    List<Pracownicy> findAllByTypPrac(String typ_prac);
}
