package com.example.test8.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "productdetail")
public class sanphamchitietEN {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "color")
    private String color;
    @Column(name = "size")
    private String size;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "image")
    private String image;
    @Column(name = "pricespct")
    private int pricespct;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "productid",referencedColumnName = "id")
    private sanphamEN sanphamEN;
    @ManyToOne
    @JoinColumn(name = "promotionid",referencedColumnName = "id")
    private khuyenmaiEN khuyenmaiEN;
}
