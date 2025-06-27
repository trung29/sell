package com.example.test8.controller.giohang;

import com.example.test8.entity.khachhangEN;
import com.example.test8.entity.nhanvienEN;
import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.repository.hoadonRepo;
import com.example.test8.service.khachhangSER;
import com.example.test8.service.nhanvienSER;
import com.example.test8.service.sanphamchitietSER;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class giohangCON {
@Autowired private khachhangSER khachhangSER;
@Autowired private nhanvienSER nhanvienSER;
@Autowired private sanphamchitietSER sanphamchitietSER;
@Autowired private hoadonRepo hoadonRepo;
    @GetMapping("cart-list")
    public String cart(Model model, HttpSession session) {
        // Lấy giỏ hàng từ session
        List<sanphamchitietEN> cart = (List<sanphamchitietEN>) session.getAttribute("cart");

        // Nếu giỏ hàng có, tính số lượng sản phẩm
        int cartSize = (cart != null) ? cart.size() : 0;

        // Truyền cartSize vào model để sử dụng trong menu.jsp
        model.addAttribute("cartSize", cartSize);

        return "/giohang/cart";
    }
@ModelAttribute("khachhangCBX")
    public List<khachhangEN> khachhangCBX(){return khachhangSER.findAll();}
@ModelAttribute("nhanvienCBX")
    public List<nhanvienEN> nhanvienCBX(){return nhanvienSER.findAll();}
@ModelAttribute("sanphamchitietCBX")
    public List<sanphamchitietEN> sanphamchitietCBX(){return sanphamchitietSER.findAll();}

    @GetMapping("cart-add/{id}")
    public String addcart(@PathVariable("id") Integer id, HttpSession session) {
        sanphamchitietEN sanphamchitiet = sanphamchitietSER.findByID(id);

        List<sanphamchitietEN> cart = (List<sanphamchitietEN>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (sanphamchitietEN item : cart) {
            if (item.getId() == sanphamchitiet.getId()) {
                item.setQuantity(item.getQuantity() + 1);  // tăng số lượng lên 1
                found = true;
                break;
            }
        }

        if (!found) {
            sanphamchitiet.setQuantity(1);  // số lượng mặc định 1 khi thêm mới
            cart.add(sanphamchitiet);
        }

        session.setAttribute("cart", cart);
        session.setAttribute("cartSize", cart.size());

        return "redirect:/cart-list";
    }


    @GetMapping("/cart-remove/{id}")
    public String removeFromCart(@PathVariable("id") Integer id, HttpSession session) {
        // Lấy giỏ hàng từ session
        List<sanphamchitietEN> cart = (List<sanphamchitietEN>) session.getAttribute("cart");

        if (cart != null) {
            // Xoá sản phẩm có ID trùng khớp khỏi giỏ hàng
            cart.removeIf(item -> id.equals(item.getId()));

        }

        // Quay lại trang giỏ hàng
        return "redirect:/cart-list";// Thay bằng URL trang giỏ hàng của bạn
    }





}
