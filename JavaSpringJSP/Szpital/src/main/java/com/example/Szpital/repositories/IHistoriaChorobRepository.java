package com.example.Szpital.repositories;

import com.example.Szpital.entities.HistoriaChorob;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IHistoriaChorobRepository extends JpaRepository<HistoriaChorob, Integer> {
}
