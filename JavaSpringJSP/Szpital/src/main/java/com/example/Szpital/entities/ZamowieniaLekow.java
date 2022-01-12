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
    @Column(name = "ilosc_leku")
    private int iloscLeku;
    private String lekarz;
    @Column(name = "status_zamowienia")
    private int status;

    public ZamowieniaLekow(String lek, int iloscLeku, String lekarz){
        this.lek = lek;
        this.iloscLeku = iloscLeku;
        this.lekarz = lekarz;
        this.status = 0;
    }
}
