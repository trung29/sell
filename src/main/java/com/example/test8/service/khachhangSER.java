package com.example.test8.service;


import com.example.test8.entity.khachhangEN;

import java.util.List;

public interface khachhangSER {
    List<khachhangEN> findAll();

    khachhangEN save(khachhangEN khachhangEN);

    void deleteByID(Integer id);

    khachhangEN findByID(Integer id);

    khachhangEN findByPhone(String phone);
}
