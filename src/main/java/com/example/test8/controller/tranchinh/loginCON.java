package com.example.test8.controller.tranchinh;


import com.example.test8.entity.nhanvienEN;
import com.example.test8.service.nhanvienSER;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class loginCON {
    @Autowired
    private nhanvienSER nhanvienSER;
    @GetMapping("login")
    private String login(){
        return "/trangchinh/login";
    }
    @GetMapping("logout")
    private String logout(HttpSession httpSession){
        httpSession.invalidate();;
        return "redirect:/trangchu";
    }
    @PostMapping("run")
    private String run(@RequestParam String phone, @RequestParam String password, Model model, HttpSession session){
        nhanvienEN nhanvienLogin = nhanvienSER.login(phone, password);
        if (nhanvienLogin != null) {
            session.setAttribute("nhanvienLogin", nhanvienLogin);
            model.addAttribute("message","Đăng nhập thành công");
                return "redirect:/trangchu";
        } else {
            session.setAttribute("loginError", "Số điện thoại hoặc mật khẩu sai!");
            return "redirect:/login";
        }
    }
}
