package com.example.Szpital.repositories;

import com.example.Szpital.entities.ZamowieniaLekow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IZamowieniaLekowRepository extends JpaRepository<ZamowieniaLekow, Integer> {
}
