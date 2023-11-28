package com.study.plan.web;

import com.study.login.vo.UserVO;
import com.study.plan.service.ExelService;
import com.study.plan.vo.PlanVo;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
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
    public void excelDownload(HttpServletResponse response, @RequestParam("title") String title, HttpSession session) throws IOException {
        XSSFWorkbook wb = null;
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;
        wb = new XSSFWorkbook();
        sheet = wb.createSheet(URLEncoder.encode(title));

        UserVO user = (UserVO) session.getAttribute("user");

        List<PlanVo> planExel = exelService.getPlanExel(title, user.getId());

        // row(행) 생성
        row = sheet.createRow(0); //0번째 행
        cell = row.createCell(0);
        cell.setCellValue(title);

        row = sheet.createRow(1);
        cell = row.createCell(0);
        cell.setCellValue(planExel.get(0).getStartDate().substring(0,10));
        cell = row.createCell(1);
        cell.setCellValue(planExel.get(0).getEndDate().substring(0,10));

        row = sheet.createRow(3); //3번째 행
        cell = row.createCell(0);
        cell.setCellValue("day");
        cell = row.createCell(1);
        cell.setCellValue("장소");
        cell = row.createCell(2);
        cell.setCellValue("주소");

        for (int i = 0; i < planExel.size(); i++) {
            row=sheet.createRow(i+4);  //4번째 행
            cell = row.createCell(0);
            cell.setCellValue(planExel.get(i).getDayCount() + "일차");
            cell = row.createCell(1);
            cell.setCellValue(planExel.get(i).getPlaceName());
            cell = row.createCell(2);
            cell.setCellValue(planExel.get(i).getPlaceLoadAddress());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(title) + ".xlsx");  //파일이름지정.
        //response OutputStream에 엑셀 작성
        wb.write(response.getOutputStream());
    }
}
