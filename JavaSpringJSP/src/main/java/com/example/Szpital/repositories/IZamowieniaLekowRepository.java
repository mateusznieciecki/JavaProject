package com.example.Szpital.repositories;

import com.example.Szpital.entities.ZamowieniaLekow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IZamowieniaLekowRepository extends JpaRepository<ZamowieniaLekow, Integer> {

    List<ZamowieniaLekow> findAllByStatus(int status);
    List<ZamowieniaLekow> findAllByLekAndStatus(String lek, int status);

}
