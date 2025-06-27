package com.example.test8.service.impl;


import com.example.test8.entity.hoadonchitietEN;
import com.example.test8.repository.hoadonchitietRepo;
import com.example.test8.service.hoadonchitietSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class hoadonchitietImpl implements hoadonchitietSER {
@Autowired
private hoadonchitietRepo hoadonchitietRepo;
@Override
    public List<hoadonchitietEN> findAll(){return hoadonchitietRepo.findAll();}
@Override
    public hoadonchitietEN save(hoadonchitietEN hoadonchitietEN){return hoadonchitietRepo.save(hoadonchitietEN);}
    @Override
    public hoadonchitietEN findByID(Integer id){return hoadonchitietRepo.findById(id).orElse(null);}
    @Override
    public List<hoadonchitietEN> getByHoadonENId(Integer id){
      return hoadonchitietRepo.findByHoadonENId(id);
    }
}
