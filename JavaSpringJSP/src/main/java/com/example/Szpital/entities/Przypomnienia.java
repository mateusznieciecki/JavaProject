package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "przypomnienia")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Przypomnienia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_przypomnienia")
    private int idPrzypomnienia;
    @Column(name = "data_przypomnienia")
    private Date dataPrzypomnienia;
    @Column(name = "tresc_przypomnienia")
    private String trescPrzypomnienia;

    public Przypomnienia(Date dataPrzypomnienia, String trescPrzypomnienia) {
        this.dataPrzypomnienia = dataPrzypomnienia;
        this.trescPrzypomnienia = trescPrzypomnienia;
    }
}
