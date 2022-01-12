package com.example.Szpital.repositories;

import com.example.Szpital.entities.Rozpoznanie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IRozpoznanieRepository extends JpaRepository<Rozpoznanie, Integer> {

    List<Rozpoznanie> findAllByOrderByIcdAsc();
    List<Rozpoznanie> findAllByOrderByIcdDesc();
    List<Rozpoznanie> findAllByOrderByOpisAsc();
    List<Rozpoznanie> findAllByOrderByOpisDesc();
    @Query(value = "SELECT * FROM Rozpoznanie WHERE icd LIKE %?1% OR opis LIKE %?1%", nativeQuery = true)
    List<Rozpoznanie> findSpecificIcd(String searchValue);

}
