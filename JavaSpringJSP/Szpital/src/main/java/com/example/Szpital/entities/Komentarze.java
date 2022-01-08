package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "komentarze")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Komentarze {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_komentarza")
    private int idKomentarza;
    @Column(name = "autor_komentarza")
    private String autorKomentarza;
    @Column(name = "tresc_komentarza")
    private String trescKomentarza;
    @Column(name = "id_wpis")
    private int idWpis;

    public Komentarze (String autorKomentarza, String trescKomentarza, int idWpis){
        this.autorKomentarza = autorKomentarza;
        this.trescKomentarza = trescKomentarza;
        this.idWpis = idWpis;
    }
}
