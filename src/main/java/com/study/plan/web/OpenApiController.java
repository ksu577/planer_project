package com.study.plan.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.study.plan.service.OpenApiService;
import com.study.plan.vo.ApiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class OpenApiController {

    @Autowired
    private OpenApiService openApiService;

    @GetMapping("/planApi/data.wow")
    public String tourSearch(){
        return "/plan/apiSearch";
    }

    @GetMapping("/tourism/data")
    public String getTourismData(Model model, @RequestParam("search") String search) throws UnsupportedEncodingException, JsonProcessingException {
        List<ApiVO> data = openApiService.getTourismData(search);
        model.addAttribute("tourismData", data);
        return "/plan/api";
    }
}
