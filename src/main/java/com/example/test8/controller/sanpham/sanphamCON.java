package com.example.test8.controller.sanpham;

import com.example.test8.entity.hoadonEN;
import com.example.test8.entity.sanphamEN;
import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.service.sanphamSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class sanphamCON {
    @Autowired
    private sanphamSER sanphamSER;
    @GetMapping("sanpham-list")
    public String findAll(Model model){
        List<sanphamEN> sanpham = sanphamSER.findAll();
        model.addAttribute("sanpham",sanpham);
        return "/sanpham/list";
    }
    @GetMapping("sanpham-add")
    public String add(){
        return "/sanpham/add";

    }
    public String generateMaSanPham() {
        List<sanphamEN> list = sanphamSER.findAll();

        int maxSo = 0;
        for (sanphamEN sp : list) {
            String code = sp.getCode(); // ví dụ: "HD001"
            if (code != null && code.startsWith("SP")) {
                try {
                    int so = Integer.parseInt(code.substring(2)); // lấy phần số, ví dụ: "001" -> 1
                    if (so > maxSo) {
                        maxSo = so;
                    }
                } catch (NumberFormatException ignored) {}
            }
        }

        int nextSo = maxSo + 1;
        return String.format("SP%03d", nextSo); // HD + 3 chữ số, ví dụ: HD007
    }
    @PostMapping("sanpham-save")
    public String save(sanphamEN sanphamEN){
        sanphamEN.setCode(generateMaSanPham());
        sanphamSER.add(sanphamEN);
        return "redirect:/sanpham-list";
    }
}
