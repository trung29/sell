package com.example.test8.controller.sanpham;

import com.example.test8.entity.sanphamEN;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ExcelHelper {
    public static String TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    static String[] HEADERS = { "Name", "Type", "Description", "Price", "Status" };

    public static boolean hasExcelFormat(MultipartFile file) {
        return TYPE.equals(file.getContentType());
    }

    public static List<sanphamEN> excelToProducts(InputStream is) {
        try {
            Workbook workbook = new XSSFWorkbook(is);
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rows = sheet.iterator();

            List<sanphamEN> products = new ArrayList<>();
            DataFormatter formatter = new DataFormatter();

            int rowNumber = 0;
            while (rows.hasNext()) {
                Row currentRow = rows.next();

                // Bỏ qua dòng header
                if (rowNumber == 0) {
                    rowNumber++;
                    continue;
                }

                sanphamEN product = new sanphamEN();

                String name = formatter.formatCellValue(currentRow.getCell(0));        // Name
                String type = formatter.formatCellValue(currentRow.getCell(1));        // Type
                String description = formatter.formatCellValue(currentRow.getCell(2)); // Description
                String priceStr = formatter.formatCellValue(currentRow.getCell(3));    // Price
                String status = formatter.formatCellValue(currentRow.getCell(4));      // Status


                // ✅ Validate các cột bắt buộc
                if (name == null || name.trim().isEmpty()) continue;
                if (type == null || type.trim().isEmpty()) continue;
                if (priceStr == null || priceStr.trim().isEmpty()) continue;
                if (description == null || description.trim().isEmpty()) {
                    description = "Đang cập nhật";
                }
                if (status == null || status.trim().isEmpty()) continue;



                product.setName(name);
                product.setType(type);
                product.setDescription(description);
                product.setPrice(priceStr);
                product.setStatus(status);


                products.add(product);
            }

            workbook.close();
            return products;

        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi đọc Excel: " + e.getMessage());
        }
    }

}
