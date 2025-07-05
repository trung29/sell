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
    public BigDecimal getPriceAfterDiscount() {
        BigDecimal originalPrice = BigDecimal.valueOf(this.getPricespct()); // ✅ Lấy giá từ SPCT
        khuyenmaiEN km = this.getKhuyenmaiEN();

        if (km != null && km.getStatus().equals("Hoạt động")) {
            LocalDate today = LocalDate.now();
            if (!today.isBefore(km.getStartdate()) && !today.isAfter(km.getEnddate())) {
                if (km.getType().equalsIgnoreCase("phantram")) {
                    // Giảm theo %
                    BigDecimal percent = km.getValue();
                    BigDecimal discount = originalPrice.multiply(percent).divide(BigDecimal.valueOf(100));
                    return originalPrice.subtract(discount);
                } else if (km.getType().equalsIgnoreCase("tienmat")) {
                    // Giảm số tiền cố định
                    return originalPrice.subtract(km.getValue());
                }
            }
        }
        return originalPrice; // Không khuyến mãi
    }



}

