package com.example.test8.repository;


import com.example.test8.entity.sanphamchitietEN;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface sanphamchitietRepo extends JpaRepository<sanphamchitietEN,Integer> {
    public List<sanphamchitietEN> findBySanphamEN_NameContainingIgnoreCase(String keyword);
    List<sanphamchitietEN> findBySanphamEN_Type(String type);
}
