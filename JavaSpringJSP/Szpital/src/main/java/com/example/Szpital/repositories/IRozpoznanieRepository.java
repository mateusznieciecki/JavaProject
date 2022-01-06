package com.example.Szpital.repositories;

import com.example.Szpital.entities.Rozpoznanie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IRozpoznanieRepository extends JpaRepository<Rozpoznanie, Integer> {
}
