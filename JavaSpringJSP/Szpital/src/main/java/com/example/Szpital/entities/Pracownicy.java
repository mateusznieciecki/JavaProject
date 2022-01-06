package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "pracownicy")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Pracownicy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String login;
    private String haslo;
    private String imie;
    private String nazwisko;
    @Column(name = "typ_prac")
    private String typPrac;
}
