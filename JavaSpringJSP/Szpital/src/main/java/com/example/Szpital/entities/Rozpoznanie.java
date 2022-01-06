package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "rozpoznanie")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Rozpoznanie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String icd;
    private String opis;
}
