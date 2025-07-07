package com.example.test8.controller.khuyenmai;

import com.example.test8.entity.khachhangEN;
import com.example.test8.entity.khuyenmaiEN;
import com.example.test8.service.hoadonSER;
import com.example.test8.service.khuyenmaiSER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;
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
    @Scheduled(cron = "*/10 * * * * ?") // Chạy mỗi phút để test nhanh (sau đổi về 0 0 0 * * ?)
    public void updatekhuyenmaiStatus(){
        LocalDate today = LocalDate.now();
        List<khuyenmaiEN> list = khuyenmaiSER.findAll();
        for (khuyenmaiEN kn : list){
            if(kn.getEnddate() != null && kn.getEnddate().isBefore(today) && "Hoạt động".equals(kn.getStatus())){
                kn.setStatus("Không hoạt động");
                khuyenmaiSER.save(kn);
                System.out.println("⚡ Đã set Không hoạt động cho: " + kn.getName());
            }
        }
    }
    @GetMapping("khuyenmai-add")
    public String khuyenmaiadd(){
        return "/khuyenmai/add";
    }
    @PostMapping("khuyenmai-save")
    public String khuyenmaisave(khuyenmaiEN khuyenmaiEN){
        khuyenmaiSER.save(khuyenmaiEN);
        return "redirect:/khuyenmai-list";
    }

}
