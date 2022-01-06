package com.example.Szpital.repositories;

import com.example.Szpital.entities.Przypomnienia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPrzypomnieniaRepository extends JpaRepository<Przypomnienia, Integer> {
}
