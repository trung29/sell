package com.example.test8.controller.nhanvien;


import com.example.test8.entity.nhanvienEN;
import com.example.test8.service.nhanvienSER;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class nhanvienCON {
    @Autowired
    private nhanvienSER nhanvienSER;
    //----------------------------------------LIST--------------------------------------------------------------------//
    @GetMapping("nhanvien-list")
    private String list(Model model){
        List<nhanvienEN> nhanvien = nhanvienSER.findAll();
        model.addAttribute("nhanvien",nhanvien);
        return "/nhanvien/list";
    }
    //----------------------------------------ADD--------------------------------------------------------------------//
    @GetMapping("nhanvien-add")
    private String nhanvienadd(){

        return "/nhanvien/add";
    }
    @PostMapping("nhanvien-save")
    private String nhanviensave(@Valid @ModelAttribute("nhanvien") nhanvienEN nhanvien, BindingResult result, Model model){
        if(result.hasErrors()){
            model.addAttribute("errors",result.getAllErrors());
            return "redirect:/nhanvien-add";
        }else{
            nhanvienSER.save(nhanvien);
            return "redirect:/nhanvien-list";
        }
    }
    //----------------------------------------DELETE--------------------------------------------------------------------//
    @GetMapping("/nhanvien-delete/{id}")
    private String delete(@PathVariable("id") Integer id){
         nhanvienSER.deletebyID(id);
         return "redirect:/nhanvien-list";
    }
    //----------------------------------------EDIT-UPDATE--------------------------------------------------------------------//
    @GetMapping("nhanvien-update/{id}")
    private String edit(@PathVariable("id") Integer id,Model model){
        nhanvienEN nhanvien = nhanvienSER.findByID(id);
        if(nhanvien == null){
            return "redirect:/nhanvien-list";

        }else{
            model.addAttribute("nhanvien",nhanvien);
            return "/nhanvien/update";
        }
    }
    @PostMapping("nhanvien-update")
    private String update(@Valid nhanvienEN nhanvienEN){
        nhanvienSER.save(nhanvienEN);
        return "redirect:/nhanvien-list";
    }
}
