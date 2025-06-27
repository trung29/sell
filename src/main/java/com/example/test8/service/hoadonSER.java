package com.example.test8.service;


import com.example.test8.entity.hoadonEN;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface hoadonSER {
    List<hoadonEN> findAll();

    hoadonEN save(hoadonEN hoadonEN);

    hoadonEN findByID(Integer id);

    Page<hoadonEN> PageAll(Pageable pageable);

    List<hoadonEN> findBySDT(Integer id);
}
