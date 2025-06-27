package com.example.test8.service;


import com.example.test8.entity.sanphamEN;

import java.util.List;

public interface sanphamSER {
    List<sanphamEN> findAll();

    sanphamEN add(sanphamEN s);
}
