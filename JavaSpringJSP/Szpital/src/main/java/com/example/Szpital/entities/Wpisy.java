package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "wpisy")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Wpisy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_wpisu;
    private String autor_wpisu;
    private String temat_wpisu;
    private String tresc_wpisu;
}
