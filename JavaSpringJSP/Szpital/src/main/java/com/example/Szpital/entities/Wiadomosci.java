package com.example.Szpital.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "wiadomosci")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Wiadomosci {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_wiadomosci")
    private int idWiadomosci;
    private String temat;
    private String tresc;
    private String od;
    @Column(name = "do_kogo")
    private String doKogo;
    private int status;

    public Wiadomosci(String temat, String tresc, String od, String doKogo) {
        this.temat = temat;
        this.tresc = tresc;
        this.od = od;
        this.doKogo = doKogo;
        this.status = 0;
    }
}
