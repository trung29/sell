package com.example.test8.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "product")
public class sanphamEN {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "code")
    private String code;
    @Column(name = "name",unique = true)
    private String name;
    @Column(name = "type")
    private String type;
    @Column(name = "description")
    private String description;
    @Column(name = "price")
    private String price;
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "sanphamEN",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<sanphamchitietEN> sanphamchitietENS;
}
