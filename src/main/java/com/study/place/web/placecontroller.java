package com.study.place.web;


import com.study.place.service.PlaceService;
import com.study.place.vo.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

@Controller
public class placecontroller {


    @Autowired
    PlaceService placeService;


    // 1. 장소 리스트
    @RequestMapping("/place/place.wow")
    public String placeList(PlaceVO placeVO, Model model) {
        List<PlaceVO> placeList = placeService.getplaceList(placeVO);
        model.addAttribute("placeList", placeList);
        return "/place/place";
    }

    // 2. 장소 상세 (모달창으로)
    @RequestMapping("/place/placeView")
    @ResponseBody
    public PlaceVO placeView(@ModelAttribute PlaceVO placeVO, Model model) {

        PlaceVO placeView = placeService.getplace(placeVO.getPlaceNum());
        return placeView;

    }

}
