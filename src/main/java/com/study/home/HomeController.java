package com.study.home;

import com.study.place.service.PlaceService;
import com.study.place.vo.PlaceVO;
import com.study.plan.service.IPlanService;
import com.study.plan.vo.PlanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    PlaceService placeService;
    final private HomeService homeService;
    final private IPlanService planService;

    @Autowired
    public HomeController(HomeService homeService, IPlanService planService) {
        this.homeService = homeService;
        this.planService = planService;
    }

    @RequestMapping("/")
    public String home(Model model, PlaceVO placeVO){
        List<PlanVo> planService = this.planService.topPlan();
        List<PlaceVO> placeList = placeService.getplaceList(placeVO);
        model.addAttribute("placeList", placeList);
        model.addAttribute("topPlan", planService);
        return "/home";
    }

    public static void main(String[] args) {
        System.out.println("a");
    }



}


