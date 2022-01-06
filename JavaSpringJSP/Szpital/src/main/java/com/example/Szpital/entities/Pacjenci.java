package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "pacjenci")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Pacjenci {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private long pesel;
    private String imie;
    private String nazwisko;
    @Column(name = "data_urodzenia")
    private Date dataUrodzenia;
    @Column(name = "lek_prow")
    private String lekProw;
    private Date ubezpieczenie;
    private String stan;

    public Pacjenci(long pesel, String imie, String nazwisko, Date dataUrodzenia, String lekProw, Date ubezpieczenie, String stan) {
        this.pesel = pesel;
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.dataUrodzenia = dataUrodzenia;
        this.lekProw = lekProw;
        this.ubezpieczenie = ubezpieczenie;
        this.stan = stan;
    }
}
