package com.example.test8.controller.tranchinh;

import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.service.sanphamchitietSER;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class trangchuController {
@Autowired
private sanphamchitietSER sanphamchitietSER;
    @GetMapping("menu")
    public String menu(){

        return "/trangchinh/menu1";
    }
    @GetMapping("trangchu")
    public String trangchu(Model model, @RequestParam(defaultValue = "0") int page){
        int pageSize = 24;
        Pageable pageable = PageRequest.of(page, pageSize);
        Page<sanphamchitietEN> sanphamPage = sanphamchitietSER.getAll(pageable);

        model.addAttribute("sanphamchitiet", sanphamPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", sanphamPage.getTotalPages());

        return "/trangchinh/trangchu";
    }
@GetMapping("sanphamviewkh")
    public String dienthoaiviewkh(@RequestParam("type")String type, Model model){
    List<sanphamchitietEN> sanphamviewkh = sanphamchitietSER.findBySanphamEN_Type(type);
    model.addAttribute("sanphamviewkh",sanphamviewkh);
    model.addAttribute("type",type);
        return "/sanphamchitiet/dienthoaiviewkh";
}
}
