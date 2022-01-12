package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "historia_chorob")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HistoriaChorob {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_choroby")
    private int idChoroby;
    private long pesel;
    private String icd;
    @Column(name = "opis_slowny")
    private String opisSlowny;
    @Column(name = "data_badania")
    private Date dataBadania;

    public HistoriaChorob(long pesel, String icd, String opisSlowny){
        this.pesel = pesel;
        this.icd = icd;
        this.opisSlowny = opisSlowny;
        this.dataBadania = new Date();
    }
}
