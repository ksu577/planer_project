package com.study.place.web;


import com.study.place.service.PlaceService;
import com.study.place.vo.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class placecontroller {


    @Autowired
    PlaceService placeService;


    // 1. 장소 리스트
    @RequestMapping("/place/place.wow")
    public String placeList(PlaceVO placeVO, Model model){
        List<PlaceVO> placeList = placeService.getplaceList(placeVO);
        model.addAttribute("placeList", placeList);
        return "place/place";
    }

    // 2. 장소 상세 (모달창으로)
    @RequestMapping("/place/placeView")
    public String placeView(@RequestParam int placeNum, Model model){
        PlaceVO placeView = placeService.getplace(placeNum);
        model.addAttribute("placeView", placeView);
        return "place/place";

    }

}
