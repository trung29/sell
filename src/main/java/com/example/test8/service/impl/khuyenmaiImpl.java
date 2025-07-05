package com.example.test8.service.impl;

import com.example.test8.entity.khuyenmaiEN;
import com.example.test8.repository.khuyenmaiRepo;
import com.example.test8.service.khuyenmaiSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class khuyenmaiImpl implements khuyenmaiSER {
    @Autowired
    private khuyenmaiRepo khuyenmaiRepo;
    @Override
    public List<khuyenmaiEN> findAll(){return khuyenmaiRepo.findAll();}
    @Override
    public khuyenmaiEN save(khuyenmaiEN khuyenmaiEN){return khuyenmaiRepo.save(khuyenmaiEN);}
}
