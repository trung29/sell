package com.example.test8.service;


import com.example.test8.entity.sanphamchitietEN;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface sanphamchitietSER {
    List<sanphamchitietEN> findAll();

    sanphamchitietEN save(sanphamchitietEN sanphamchitietEN);

    void deleteByID(Integer id);

    Page<sanphamchitietEN> getAll(Pageable pageable);

    sanphamchitietEN findByID(Integer id);

    List<sanphamchitietEN> findBySanpham(String keyword);

    List<sanphamchitietEN> findBySanphamEN_Type(String type);
}
