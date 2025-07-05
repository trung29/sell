package com.example.test8.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "ordersdetail")
public class hoadonchitietEN {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ordersid",referencedColumnName = "id")
    private hoadonEN hoadonEN;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "productdetailid",referencedColumnName = "id")
    private sanphamchitietEN sanphamchitietEN;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "price")
    private Integer price;
    @Column(name = "original_price")
    private Integer originalPrice;
    @Column(name = "discount_type")
    private String discounttype;
    @Column(name = "discount_value")
    private BigDecimal discountvalue;
    @Column(name = "subtotal")
    private Integer subtotal;
}
