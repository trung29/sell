package com.example.test8.controller.khuyenmai;

import com.example.test8.entity.khachhangEN;
import com.example.test8.entity.khuyenmaiEN;
import com.example.test8.service.hoadonSER;
import com.example.test8.service.khuyenmaiSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class khuyenmaiCON {
    @Autowired
    private khuyenmaiSER khuyenmaiSER;

    @GetMapping("khuyenmai-list")
    public String list(Model model){
        List<khuyenmaiEN> khuyenmai = khuyenmaiSER.findAll();
        model.addAttribute("khuyenmai",khuyenmai);
        return "/khuyenmai/list";
    }
}
