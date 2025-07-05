package com.example.test8.controller.giohang;


import com.example.test8.entity.hoadonEN;
import com.example.test8.entity.khachhangEN;

import com.example.test8.entity.hoadonchitietEN;
import com.example.test8.entity.sanphamchitietEN;
import com.example.test8.repository.hoadonRepo;
import com.example.test8.repository.hoadonchitietRepo;
import com.example.test8.service.hoadonSER;
import com.example.test8.service.hoadonchitietSER;
import com.example.test8.service.khachhangSER;
import com.example.test8.service.sanphamchitietSER;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Controller
public class hoadonCON {
    @Autowired
    private hoadonSER hoadonSER;
    @Autowired private hoadonchitietSER hoadonchitietSER;
    @Autowired private khachhangSER khachhangSER;
    @Autowired private sanphamchitietSER sanphamchitietSER;
    @Autowired private hoadonchitietRepo hoadonchitietRepo;
    @Autowired private com.example.test8.repository.hoadonRepo hoadonRepo;

    public String generateMaHoaDon() {
        List<hoadonEN> list = hoadonRepo.findAll();

        int maxSo = 0;
        for (hoadonEN hd : list) {
            String code = hd.getCode(); // ví dụ: "HD001"
            if (code != null && code.startsWith("HD")) {
                try {
                    int so = Integer.parseInt(code.substring(2)); // lấy phần số, ví dụ: "001" -> 1
                    if (so > maxSo) {
                        maxSo = so;
                    }
                } catch (NumberFormatException ignored) {}
            }
        }

        int nextSo = maxSo + 1;
        return String.format("HD%03d", nextSo); // HD + 3 chữ số, ví dụ: HD007
    }

    @PostMapping("hoadon-save")
    public String save(@ModelAttribute hoadonEN hoadonEN,
                       @RequestParam("sanphamIds") List<Integer> sanphamIds,
                       @RequestParam("quantities") List<Integer> quantities,
                       @RequestParam(value = "khachhangEN", required = false) String khachhangEN,
                       @RequestParam(value = "khachleName", required = false) String khachleName,
                       HttpSession session) {

        // ✅ Xử lý khách hàng
        if (khachhangEN == null || khachhangEN.trim().isEmpty()) {
            // Nếu chọn khách lẻ => lưu tên khách lẻ
            hoadonEN.setTen_nguoi_nhan(khachleName);  // giả sử hoadonEN có trường này
            hoadonEN.setKhachhangEN(null); // tránh lỗi ánh xạ nếu có
        } else {
            // Nếu chọn khách trong database
            try {
                Integer idKH = Integer.parseInt(khachhangEN);
                khachhangEN kh = khachhangSER.findByID(idKH);
                hoadonEN.setKhachhangEN(kh);
            } catch (NumberFormatException e) {
                // Trường hợp không parse được ID
                hoadonEN.setKhachhangEN(null);
            }
        }

        // 🔹 Kiểm tra số lượng tồn kho
        for (int i = 0; i < sanphamIds.size(); i++) {
            sanphamchitietEN sanpham = sanphamchitietSER.findByID(sanphamIds.get(i));
            int soluongkhachmua = quantities.get(i);
            int sanphamtrongkho = sanpham.getQuantity();

            if (soluongkhachmua > sanphamtrongkho || sanphamtrongkho == 0) {
                System.out.println("❌ Số lượng vượt quá tồn kho");
                session.setAttribute("quantityError","Quá số lượng tồn kho");
                return "redirect:/cart-list";
            }
        }

        // 🔹 Lưu hóa đơn
        hoadonEN.setCode(generateMaHoaDon());
        hoadonEN savedHoaDon = hoadonSER.save(hoadonEN);
        // 🔹 Lưu chi tiết hóa đơn
        for (int i = 0; i < sanphamIds.size(); i++) {
            hoadonchitietEN hdct = new hoadonchitietEN();
            hdct.setHoadonEN(savedHoaDon);
            sanphamchitietEN spct = sanphamchitietSER.findByID(sanphamIds.get(i));
            hdct.setSanphamchitietEN(spct);

            int quantity = quantities.get(i);
            Integer pricetruoc = spct.getPricespct(); // giá gốc
            Integer pricesau = spct.getPriceAfterDiscount().intValue(); // ✅ Lấy giá sau giảm

            hdct.setQuantity(quantity);
            hdct.setPrice(pricesau);
            hdct.setOriginalPrice(pricetruoc); // ✅ Giá gốc lúc mua
            hdct.setSubtotal(quantity * pricesau);
            System.out.println("giá gốc: "+ pricetruoc);
            System.out.println("giá sau giảm: "+ pricesau);
            if (spct.getKhuyenmaiEN() != null && spct.getKhuyenmaiEN().getStatus().equals("Hoạt động")) {
                hdct.setDiscounttype(spct.getKhuyenmaiEN().getType()); // phantram hoặc tienmat
                hdct.setDiscountvalue(spct.getKhuyenmaiEN().getValue()); // số %
            } else {
                hdct.setDiscounttype("none");
                hdct.setDiscountvalue(BigDecimal.ZERO);
            }

            hoadonchitietSER.save(hdct);

            // 🔹 Cập nhật tồn kho
            int currentStock = spct.getQuantity();
            spct.setQuantity(currentStock - quantity);
            sanphamchitietSER.save(spct);
        }


        // 🔹 Xóa giỏ hàng
        session.removeAttribute("cart");

        return "redirect:/trangchu";
    }




    @GetMapping("hoadon-list")
    public String listHoaDon(Model model,
                             @RequestParam(defaultValue = "0") int p) {
        Pageable pageable = PageRequest.of(p, 10); // 5 là số dòng mỗi trang, bạn có thể chỉnh lại
        Page<hoadonEN> hoadonPage = hoadonSER.PageAll(pageable);

        model.addAttribute("hoadonPage", hoadonPage);
        return "hoadon/hoadon"; // JSP hoặc Thymeleaf view
    }



    @GetMapping("/hoadon-hoadonchitiet/{id}")
    public String viewHoaDonChiTiet(@PathVariable("id") int hoadonId, Model model) {
        // Lấy hóa đơn theo ID
        hoadonEN hoadon = hoadonSER.findByID(hoadonId);

        // Lấy danh sách hóa đơn chi tiết theo hóa đơn ID
        List<hoadonchitietEN> hoadonChiTietList = hoadonchitietRepo.findByHoadonEN(hoadon);

        // Đưa dữ liệu vào Model
        model.addAttribute("hoadon", hoadon);
        model.addAttribute("hoadonChiTietList", hoadonChiTietList);

        // Trả về trang JSP hiển thị hóa đơn chi tiết
        return "/hoadon/hoadonchitiet";
    }

    @GetMapping("/hoadon/export/{id}")
    public void excel(@PathVariable("id")Integer id, HttpServletResponse response) throws IOException {
            hoadonEN hoaDon = hoadonSER.findByID(id);
            List<hoadonchitietEN> hoaDonChiTiet = hoadonchitietRepo.findByHoadonENId(id);
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        String fileName = "hoadon_" + hoaDon.getCode() + ".xlsx";
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

        // Tạo workbook và sheet
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Hóa đơn");

        int rowNum = 0;

        // Ghi thông tin hóa đơn
        sheet.createRow(rowNum++).createCell(0).setCellValue("Mã Hóa Đơn: " + hoaDon.getCode());
        sheet.createRow(rowNum++).createCell(0).setCellValue("Ngày Tạo: " + hoaDon.getOrder_date());
        if(hoaDon.getKhachhangEN() != null){
            sheet.createRow(rowNum++).createCell(0).setCellValue("Tên khách hàng: " + hoaDon.getKhachhangEN().getName());

        }else{
            sheet.createRow(rowNum++).createCell(0).setCellValue("Tên khách hàng:( Không có )");
        }
        sheet.createRow(rowNum++).createCell(0).setCellValue("Tên người nhận: " + hoaDon.getTen_nguoi_nhan());

        if(hoaDon.getKhachhangEN() != null){
            String phone = hoaDon.getKhachhangEN().getPhone();
            sheet.createRow(rowNum++).createCell(0).setCellValue("SĐT: " + phone);
        }else{
            sheet.createRow(rowNum++).createCell(0).setCellValue("SĐT: ( không có )");
        }

        if(hoaDon.getKhachhangEN() != null){
            String diachi = hoaDon.getKhachhangEN().getAddress();
            sheet.createRow(rowNum++).createCell(0).setCellValue("Địa chỉ: " + diachi);
        }else{
            sheet.createRow(rowNum++).createCell(0).setCellValue("Địa chỉ: ( không có )");
        }

        rowNum++; // Dòng trống

        // Tiêu đề chi tiết
        Row headerRow = sheet.createRow(rowNum++);
        headerRow.createCell(0).setCellValue("STT");
        headerRow.createCell(1).setCellValue("Tên sản phẩm");
        headerRow.createCell(2).setCellValue("Số lượng");
        headerRow.createCell(3).setCellValue("Đơn giá");
        headerRow.createCell(4).setCellValue("Thành tiền");

        // Ghi từng dòng chi tiết
        int stt = 1;
        for (hoadonchitietEN c : hoaDonChiTiet) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(stt++);
            row.createCell(1).setCellValue(c.getSanphamchitietEN().getSanphamEN().getName());
            row.createCell(2).setCellValue(c.getQuantity());
            row.createCell(3).setCellValue(c.getPrice());
            row.createCell(4).setCellValue(c.getPrice() * c.getQuantity());
        }

        // Ghi tổng tiền
        rowNum++;
        Row totalRow = sheet.createRow(rowNum++);
        totalRow.createCell(3).setCellValue("Tổng tiền:");
        totalRow.createCell(4).setCellValue(hoaDon.getTotal_price());

        // Ghi ra response
        ServletOutputStream out = response.getOutputStream();
        workbook.write(out);
        workbook.close();
        out.close();
    }
    @GetMapping("formhienthongtin")
    public String formhienthongtin(){
        return "/tracuu/formhienthongtin";
    }
    @GetMapping("formnhapthongtin")
    public String formnhapthongtin(){
        return "/tracuu/formnhapthongtin";
    }

}
