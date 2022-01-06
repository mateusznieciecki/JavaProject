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
    private int id_przypomnienia;
    private Date data_przypomnienia;
    private String tresc_przypomnienia;
}
