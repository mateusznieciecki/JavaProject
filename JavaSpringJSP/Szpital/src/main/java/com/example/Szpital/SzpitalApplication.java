package com.example.Szpital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.example.szpital")
public class SzpitalApplication {

	public static void main(String[] args) {
		SpringApplication.run(SzpitalApplication.class, args);
	}

}
