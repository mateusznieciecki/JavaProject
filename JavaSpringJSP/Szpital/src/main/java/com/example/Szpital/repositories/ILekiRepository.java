package com.example.Szpital.repositories;

import com.example.Szpital.entities.Leki;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ILekiRepository extends JpaRepository<Leki, Integer> {
}
