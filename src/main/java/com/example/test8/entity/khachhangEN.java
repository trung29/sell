package com.example.test8.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "customer")
public class khachhangEN {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "code")
    private String code;
    @Column(name = "name")
    private String name;
    @Column(name = "gender")
    private String gender;
    @Column(name = "birthday")
    private String birthday;
    @Column(name = "address")
    private String address;
    @Column(name = "phone",unique = true)
    private String phone;
    @Column(name = "email")
    private String email;
    @Column(name = "creat_at")
    private String creat;
    @Column(name = "status")
    private String status;
}
