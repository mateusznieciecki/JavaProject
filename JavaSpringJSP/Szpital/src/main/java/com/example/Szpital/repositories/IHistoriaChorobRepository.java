package com.example.Szpital.repositories;

import com.example.Szpital.entities.HistoriaChorob;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHistoriaChorobRepository extends JpaRepository<HistoriaChorob, Integer> {

    @Query(value = "SELECT * FROM historia_chorob WHERE pesel = ?1 LIMIT ?2", nativeQuery = true)
    List<HistoriaChorob> findByPeselWithLimit(Long pesel, int limit);

}
