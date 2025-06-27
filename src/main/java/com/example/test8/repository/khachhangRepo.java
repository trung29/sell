package com.example.test8.repository;

import com.example.test8.entity.khachhangEN;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface khachhangRepo extends JpaRepository<khachhangEN,Integer> {
    khachhangEN findByPhone(String phone);
}
