package com.example.test8.repository;

import com.example.test8.entity.hoadonEN;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface hoadonRepo extends JpaRepository<hoadonEN,Integer> {
    boolean existsByCode(String code);
    public List<hoadonEN> findByKhachhangEN_Id(Integer id);
}
