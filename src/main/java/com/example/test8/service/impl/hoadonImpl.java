package com.example.test8.service.impl;


import com.example.test8.entity.hoadonEN;
import com.example.test8.repository.hoadonRepo;
import com.example.test8.service.hoadonSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class hoadonImpl implements hoadonSER {
@Autowired
private hoadonRepo hoadonRepo;
    @Override
    public List<hoadonEN> findAll(){return hoadonRepo.findAll();}
    @Override
    public hoadonEN save(hoadonEN hoadonEN){return hoadonRepo.save(hoadonEN);}
    @Override
    public hoadonEN findByID(Integer id){return hoadonRepo.findById(id).orElse(null);}
    @Override
    public Page<hoadonEN> PageAll(Pageable pageable){
        return hoadonRepo.findAll(pageable);
    }
    @Override
    public List<hoadonEN> findBySDT(Integer id){return hoadonRepo.findByKhachhangEN_Id(id);}
}
