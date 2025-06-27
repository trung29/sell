package com.example.test8.repository;

import com.example.test8.entity.nhanvienEN;
import org.springframework.data.jpa.repository.JpaRepository;

public interface nhanvienRepo extends JpaRepository<nhanvienEN,Integer> {
    nhanvienEN findByPhoneAndPassword (String phone, String password);
}
