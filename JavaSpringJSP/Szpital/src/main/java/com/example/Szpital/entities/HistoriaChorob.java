package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "historia_chorob")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HistoriaChorob {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_choroby;
    private long pesel;
    private String icd;
    private String opis_slowny;
    private Date data_badania;
}
