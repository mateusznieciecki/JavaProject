package com.example.Szpital.repositories;

import com.example.Szpital.entities.Komentarze;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IKomentarzeRepository extends JpaRepository<Komentarze, Integer> {

    List<Komentarze> findAllByIdWpis(int topicId);

}
