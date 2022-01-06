package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "zamowienia_lekow")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ZamowieniaLekow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String lek;
    private int ilosc_leku;
    private String lekarz;
    private int status_zamowienia;
}
