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
@Table(name = "orders")
public class hoadonEN {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "code",unique = true)
    private String code;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employeeid",referencedColumnName = "id")
    private nhanvienEN nhanvienEN;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "customerid",referencedColumnName = "id")
    private khachhangEN khachhangEN;
    @Column(name = "order_date")
    private String order_date;
    @Column(name = "total_price")
    private String total_price;
    @Column(name = "status")
    private String status;
    @Column(name = "ten_nguoi_nhan")
    private String ten_nguoi_nhan;
    @OneToMany(mappedBy = "hoadonEN",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<hoadonchitietEN> hoadonchitietENS;
}
