package com.example.Szpital.repositories;

import com.example.Szpital.entities.Wpisy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IWpisyRepository extends JpaRepository<Wpisy, Integer> {
}
