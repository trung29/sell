package com.example.test8.service.impl;


import com.example.test8.entity.khachhangEN;
import com.example.test8.repository.khachhangRepo;
import com.example.test8.service.khachhangSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class khachhangImpl implements khachhangSER {
    @Autowired
    private khachhangRepo khachhangRepo;
    @Override
    public List<khachhangEN> findAll(){return khachhangRepo.findAll();}
    @Override
    public khachhangEN save(khachhangEN khachhangEN){return khachhangRepo.save(khachhangEN);}
    @Override
    public void deleteByID(Integer id){khachhangRepo.deleteById(id);}
    @Override
    public khachhangEN findByID(Integer id){return khachhangRepo.findById(id).orElse(null);}
    @Override
    public khachhangEN findByPhone(String phone){return khachhangRepo.findByPhone(phone);}
}
