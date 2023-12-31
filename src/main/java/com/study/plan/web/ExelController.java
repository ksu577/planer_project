package com.study.plan.web;

import com.study.login.vo.UserVO;
import com.study.plan.service.ExelService;
import com.study.plan.vo.PlanVo;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class ExelController {

    @Autowired
    ExelService exelService;

    @GetMapping("/plan/excelDown")
    public void excelDownload(HttpServletResponse response, @RequestParam("title") String title, @RequestParam("id") String id) throws IOException {
        XSSFWorkbook wb = null;
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;
        wb = new XSSFWorkbook();
        sheet = wb.createSheet(URLEncoder.encode(title));
        XSSFCellStyle style = wb.createCellStyle();
        XSSFCellStyle headerStyle = wb.createCellStyle();  // 헤더 스타일
        XSSFCellStyle dateStyle = wb.createCellStyle();  // 헤더 스타일

        // 헤더 스타일 설정
        headerStyle.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        setBorderStyle(headerStyle);

        Font datefont = wb.createFont();

        // 폰트 스타일 설정
        datefont = wb.createFont();
        datefont.setBoldweight(datefont.BOLDWEIGHT_BOLD); // 굵게
        datefont.setFontHeightInPoints((short) 18); // 크기 20포인트
        dateStyle.setFont(datefont);


        style.setFillForegroundColor(IndexedColors.YELLOW.getIndex()); //배경색
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);


        Font font = wb.createFont();

        // 폰트 스타일 설정
        font = wb.createFont();
        font.setBoldweight(font.BOLDWEIGHT_BOLD); // 굵게
        font.setFontHeightInPoints((short) 20); // 크기 20포인트
        font.setColor(IndexedColors.BLUE.getIndex()); // 파란색
        style.setFont(font);

        List<PlanVo> planExel = exelService.getPlanExel(title, id);

        // row(행) 생성
        row = sheet.createRow(1); // 0번째 행
        cell = row.createCell(1);
        cell.setCellValue(title);
        cell.setCellStyle(style);

        row = sheet.createRow(3);
        cell = row.createCell(1);
        cell.setCellValue(planExel.get(0).getStartDate().substring(0, 10)); // 출발날짜
        cell.setCellStyle(dateStyle);
        cell = row.createCell(2);
        cell.setCellValue(planExel.get(0).getEndDate().substring(0, 10)); // 도착날짜
        cell.setCellStyle(dateStyle);

        row = sheet.createRow(5); //3번째 행
        cell = row.createCell(1);
        cell.setCellValue("day");
        cell.setCellStyle(headerStyle);
        cell = row.createCell(2);
        cell.setCellValue("장소");
        cell.setCellStyle(headerStyle);
        cell = row.createCell(3);
        cell.setCellValue("주소");
        cell.setCellStyle(headerStyle);

        for (int i = 0; i < planExel.size(); i++) {
            row = sheet.createRow(i + 5 + planExel.get(i).getDayCount());  //4번째 행
            cell = row.createCell(1);
            if (i==0){
                cell.setCellValue(planExel.get(i).getDayCount() + "일차");
            }else if(planExel.get(i).getDayCount() != planExel.get(i-1).getDayCount()) {
                cell.setCellValue(planExel.get(i).getDayCount() + "일차");
            }

            cell = row.createCell(2);
            cell.setCellValue(planExel.get(i).getPlaceName());
            cell = row.createCell(3);
            cell.setCellValue(planExel.get(i).getPlaceLoadAddress());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(title) + ".xlsx");  //파일이름지정.
        //response OutputStream에 엑셀 작성
        wb.write(response.getOutputStream());
    }

    private void setBorderStyle(XSSFCellStyle style) {
        style.setBorderBottom(BorderStyle.THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderLeft(BorderStyle.THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderRight(BorderStyle.THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderTop(BorderStyle.THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
    }
}