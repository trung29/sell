package com.example.test8.service;


import com.example.test8.entity.nhanvienEN;

import java.util.List;

public interface nhanvienSER {
    List<nhanvienEN> findAll();

    nhanvienEN save(nhanvienEN nhanvienEN);

    void deletebyID(Integer id);

    nhanvienEN findByID(Integer id);

    nhanvienEN login(String phone, String password);
}
