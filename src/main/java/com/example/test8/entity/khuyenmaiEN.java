package com.example.test8.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "promotion")
public class khuyenmaiEN {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "code")
    private String code;
    @Column(name = "name")
    private String name;
    @Column(name = "type")
    private String type;
    @Column(name = "startdate")
    private LocalDate startdate;
    @Column(name = "enddate")
    private LocalDate enddate;
    @Column(name = "value")
    private BigDecimal value;
    @Column(name = "status")
    private String status;
}
