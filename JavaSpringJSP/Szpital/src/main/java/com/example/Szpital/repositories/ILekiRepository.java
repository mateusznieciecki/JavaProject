package com.example.Szpital.repositories;

import com.example.Szpital.entities.Leki;
import com.example.Szpital.entities.Rozpoznanie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ILekiRepository extends JpaRepository<Leki, Integer> {
    Leki findByNazwa(String nazwa);
    List<Leki> findAllByOrderByNazwaAsc();
    List<Leki> findAllByOrderByNazwaDesc();
    List<Leki> findAllByOrderByIloscAsc();
    List<Leki> findAllByOrderByIloscDesc();
    @Query(value = "SELECT * FROM Leki WHERE nazwa LIKE %?1%", nativeQuery = true)
    List<Leki> findSpecificMedicines(String searchValue);


}
