package com.study.plan.web;

import com.study.login.vo.UserVO;
import com.study.plan.service.TourService;
import com.study.plan.vo.TourVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class TourController {

    @Autowired
    TourService tourService;

    @GetMapping("/plan/title.wow")
    public String plaTitle() {
        return "plan/title";
    }

    @PostMapping("/title")
    public String planTitle(@ModelAttribute("tour") TourVO tour, HttpSession session) {
            UserVO user = (UserVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login/login.wow";
        } else {
            tour.setId(user.getId());
            System.out.println(user);
            tourService.TourPlan(tour);
            return "redirect:/plan/plan.wow";
        }
    }
}