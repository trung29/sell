package com.example.test8.controller.khachhang;


import com.example.test8.entity.hoadonEN;
import com.example.test8.entity.khachhangEN;
import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.repository.hoadonRepo;
import com.example.test8.service.hoadonSER;
import com.example.test8.service.khachhangSER;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class khachhangCON {
@Autowired
private khachhangSER khachhangSER;
@Autowired
private hoadonSER hoadonSER;

@GetMapping("khachhang-list")
    public String list(Model model){
    List<khachhangEN> khachhang = khachhangSER.findAll();
    model.addAttribute("khachhang",khachhang);
    return "/khachhang/list";
}
@GetMapping("khachhang-add")
public String add(){
    return "/khachhang/add";
}
@PostMapping("khachhang-save")
    public String save( khachhangEN khachhangEN,Model model){

    khachhangEN exiting = khachhangSER.findByPhone(khachhangEN.getPhone());
    if(exiting != null){
        model.addAttribute("errorsdt","Số đã tồn tại");
        model.addAttribute("khachhang",khachhangEN);
        return "khachhang/add";
    }
    khachhangSER.save(khachhangEN);
    return "redirect:/khachhang-list";
}
@GetMapping("khachhang-delete/{id}")
    public String delete(@PathVariable("id")Integer id){
    khachhangSER.deleteByID(id);
    return "redirect:/khachhang-list";
}
@GetMapping("khachhang-update/{id}")
    public String edit(@PathVariable("id") Integer id,Model model){
    khachhangEN khachhang = khachhangSER.findByID(id);
    model.addAttribute("khachhang",khachhang);
    return "/khachhang/update";

}
@PostMapping("khachhang-update")
    public String update(khachhangEN khachhangEN){
    khachhangSER.save(khachhangEN);
    return "redirect:/khachhang-list";
}
    @GetMapping("tracuu-search")
    private String tracuu(@RequestParam("phone")String phone, Model model, HttpSession session){
        khachhangEN khachhangphone = khachhangSER.findByPhone(phone);
        if(khachhangphone == null){
            session.setAttribute("phoneError", "Số điện thoại không tồn tại!");
            return "redirect:/formnhapthongtin";

        }else{

            List<hoadonEN> danhsachhoadon = hoadonSER.findBySDT(khachhangphone.getId());
            model.addAttribute("danhsachhoadon",danhsachhoadon);

            model.addAttribute("khachhangphone",khachhangphone);
            return "/tracuu/formhienthongtin";
        }

    }
    //-------------------------------------------------------// OTP

}
