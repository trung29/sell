package com.example.test8.repository;


import com.example.test8.entity.hoadonEN;
import com.example.test8.entity.hoadonchitietEN;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface hoadonchitietRepo extends JpaRepository<hoadonchitietEN,Integer> {
    List<hoadonchitietEN> findByHoadonEN(hoadonEN hoadon);
    List<hoadonchitietEN> findByHoadonENId(Integer hoaDonId);

}
