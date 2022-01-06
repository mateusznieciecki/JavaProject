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
    private int id_komentarza;
    private String autor_komentarza;
    private String tresc_komentarza;
    private int id_wpis;
}
