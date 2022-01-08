package com.example.Szpital.repositories;

import com.example.Szpital.entities.Wiadomosci;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IWiadomosciRepository extends JpaRepository<Wiadomosci, Integer> {
    List<Wiadomosci> findAllByDoKogo(String doKogo);
    List<Wiadomosci> findAllByOd(String login);
}
