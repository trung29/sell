package com.example.test8.service.impl;


import com.example.test8.entity.nhanvienEN;
import com.example.test8.repository.nhanvienRepo;
import com.example.test8.service.nhanvienSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class nhanvienIMPL implements nhanvienSER {
    @Autowired
    private nhanvienRepo nhanvienRepo;
    @Override
    public List<nhanvienEN> findAll(){
        return nhanvienRepo.findAll();
    }
    @Override
    public nhanvienEN save(nhanvienEN nhanvienEN){
        return nhanvienRepo.save(nhanvienEN);
    }
    @Override
    public void deletebyID(Integer id){
         nhanvienRepo.deleteById(id);
    }
    @Override
    public nhanvienEN findByID(Integer id){
       return nhanvienRepo.findById(id).orElse(null);
    }

    @Override
    public nhanvienEN login(String phone, String password){
        return nhanvienRepo.findByPhoneAndPassword(phone, password);
    }
}
