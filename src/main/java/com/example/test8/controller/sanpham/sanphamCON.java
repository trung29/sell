package com.example.test8.controller.sanpham;

import com.example.test8.entity.hoadonEN;
import com.example.test8.entity.sanphamEN;
import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.repository.sanphamRepo;
import com.example.test8.service.sanphamSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class sanphamCON {
    @Autowired
    private sanphamSER sanphamSER;
    @Autowired
    private sanphamRepo sanphamRepo;
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
    @PostMapping("/product/import")
    public String importProducts(@RequestParam("file") MultipartFile file) {
        try {
            List<sanphamEN> products = ExcelHelper.excelToProducts(file.getInputStream());

            int maxSo = 0;
            List<sanphamEN> existingProducts = sanphamSER.findAll();

            // Tìm số lớn nhất hiện có
            for (sanphamEN sp : existingProducts) {
                String code = sp.getCode();
                if (code != null && code.startsWith("SP")) {
                    try {
                        int so = Integer.parseInt(code.substring(2));
                        if (so > maxSo) maxSo = so;
                    } catch (NumberFormatException ignored) {}
                }
            }

            // Gán code tự tăng cho từng sản phẩm trong danh sách import
            int nextSo = maxSo + 1;
            for (sanphamEN sp : products) {
                sp.setCode(String.format("SP%03d", nextSo++));
            }

            sanphamRepo.saveAll(products);
            return "redirect:/sanpham-list";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/product-error";
        }
    }

}
