package com.example.test8.controller.sanphamchitiet;


import com.example.test8.entity.*;
import com.example.test8.service.khuyenmaiSER;
import com.example.test8.service.sanphamSER;
import com.example.test8.service.sanphamchitietSER;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class sanphamchitietCON {
    @Autowired
    private sanphamchitietSER sanphamchitietSER;
    @Autowired
    private sanphamSER sanphamSER;
    @Autowired
    private khuyenmaiSER khuyenmaiSER;
    @GetMapping("sanphamchitiet-list")
    public String findAll(Model model){
        List<sanphamchitietEN> sanphamchitiet = sanphamchitietSER.findAll();
        model.addAttribute("sanphamchitiet",sanphamchitiet);
        return "/sanphamchitiet/list";
    }
//    @GetMapping("sanphamchitiet-list-v1")
//    public String paginate(Model model, @RequestParam("p") Optional<Integer> p){
//        Pageable pageable = PageRequest.of(p.orElse(0),5);
//        Page<sanphamchitietEN> page = sanphamchitietSER.getAll(pageable);
//        model.addAttribute("sanphamchitietv1",page);
//        return "/sanphamchitiet/list";
//    }
    @GetMapping("sanphamchitietkh-list")
    public String findAllkh(Model model){
        List<sanphamchitietEN> sanphamchitiet = sanphamchitietSER.findAll();
        model.addAttribute("sanphamchitiet",sanphamchitiet);
        return "/sanphamchitiet/sanphamviewkh";
    }
    @GetMapping("sanphamchitiet-add")
        public String add(@RequestParam(name = "type", required = false) String type, Model model){
        List<sanphamEN> list = sanphamSER.findAll();
            model.addAttribute("typeSelect",type);
            model.addAttribute("sanphamCBX",list);
            return "/sanphamchitiet/add";

    }
    @PostMapping("sanphamchitiet-save")
    public String save(sanphamchitietEN sanphamchitietEN){
        sanphamchitietSER.save(sanphamchitietEN);
        return "redirect:/sanphamchitiet-list";
    }
    @GetMapping("sanphamchitiet-delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        sanphamchitietSER.deleteByID(id);
        return "redirect:/sanphamchitiet-list";
    }
//    @ModelAttribute("sanphamCBX")
//    public List<sanphamEN> sanphamCBX(){
//        return sanphamSER.findAll();
//    }

    @GetMapping("sanphamchitiet-update/{id}")
    private String edit(@PathVariable("id") Integer id,@RequestParam(name = "type", required = false) String type,Model model){
        List<sanphamEN> list = sanphamSER.findAll();
        sanphamchitietEN sanphamchitiet = sanphamchitietSER.findByID(id);
        model.addAttribute("sanphamCBX",list);
        if(sanphamchitiet == null){
            return "redirect:/sanphamchitiet-list";

        }else{
            model.addAttribute("sanphamchitiet",sanphamchitiet);
            return "/sanphamchitiet/edit";
        }
    }
    @PostMapping("sanphamchitiet-update")
    private String update(@Valid sanphamchitietEN sanphamchitietEN){
        sanphamchitietSER.save(sanphamchitietEN);
        return "redirect:/sanphamchitiet-list";
    }
    @GetMapping("sanphamchitiet-search")
    private String search(@RequestParam("keyword")String keyword,Model model){
        List<sanphamchitietEN> sanphamchitiet = sanphamchitietSER.findBySanpham(keyword);
        model.addAttribute("sanphamchitiet",sanphamchitiet);
        return "/sanphamchitiet/search";
    }
    @GetMapping("sanpham-detail/{id}")
    private String detail(@PathVariable("id") Integer id, Model model){
        sanphamchitietEN sanphamchitietEN = sanphamchitietSER.findByID(id);
        if(sanphamchitietEN == null){
            return "redirect:/trangchu";
        }else{
            model.addAttribute("detail",sanphamchitietEN);
            return "/sanphamchitiet/thongtinchitiet";
        }
    }
    @ModelAttribute("khuyenmaiCBX")
    public List<khuyenmaiEN> khuyenmaiCBX(){return khuyenmaiSER.findAll();}
}
