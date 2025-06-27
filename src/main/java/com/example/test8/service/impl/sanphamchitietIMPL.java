package com.example.test8.service.impl;


import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.repository.sanphamchitietRepo;
import com.example.test8.service.sanphamchitietSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class sanphamchitietIMPL implements sanphamchitietSER {
    @Autowired
    private sanphamchitietRepo sanphamchitietRepo;
    @Override
    public List<sanphamchitietEN> findAll(){
        return sanphamchitietRepo.findAll();
    }
    @Override
    public sanphamchitietEN save(sanphamchitietEN sanphamchitietEN){return sanphamchitietRepo.save(sanphamchitietEN);}
    @Override
    public void deleteByID(Integer id){ sanphamchitietRepo.deleteById(id);}
    @Override
    public Page<sanphamchitietEN> getAll(Pageable pageable){
        return sanphamchitietRepo.findAll(pageable);
    }
    @Override
    public sanphamchitietEN findByID(Integer id){return sanphamchitietRepo.findById(id).orElse(null);}

    @Override
    public List<sanphamchitietEN> findBySanpham(String keyword){return sanphamchitietRepo.findBySanphamEN_NameContainingIgnoreCase(keyword);}
    @Override
    public List<sanphamchitietEN> findBySanphamEN_Type(String type){return sanphamchitietRepo.findBySanphamEN_Type(type);}
}
