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
    @Column(name = "id_wpisu")
    private int idWpisu;
    @Column(name = "autor_wpisu")
    private String autorWpisu;
    @Column(name = "temat_wpisu")
    private String tematWpisu;
    @Column(name = "tresc_wpisu")
    private String trescWpisu;

    public Wpisy(String autorWpisu, String tematWpisu, String trescWpisu) {
        this.autorWpisu = autorWpisu;
        this.tematWpisu = tematWpisu;
        this.trescWpisu = trescWpisu;
    }
}
