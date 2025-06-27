package com.example.test8.service;


import com.example.test8.entity.hoadonchitietEN;

import java.util.List;

public interface hoadonchitietSER {
    List<hoadonchitietEN> findAll();

    hoadonchitietEN save(hoadonchitietEN hoadonchitietEN);

    hoadonchitietEN findByID(Integer id);

    List<hoadonchitietEN> getByHoadonENId(Integer id);
}
