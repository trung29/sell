package com.example.test8.service.impl;


import com.example.test8.entity.sanphamEN;
import com.example.test8.repository.sanphamRepo;
import com.example.test8.service.sanphamSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class sanphamIMPL implements sanphamSER {
    @Autowired
    private sanphamRepo sanphamRepo;
    @Override
    public List<sanphamEN> findAll(){return sanphamRepo.findAll();}
    @Override
    public sanphamEN add(sanphamEN s){return sanphamRepo.save(s);}
}
