package com.study.plan.web;

import com.study.login.vo.UserVO;
import com.study.plan.service.TourService;
import com.study.plan.vo.TourVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class TourController {

    @Autowired
    TourService tourService;

    @GetMapping("/plan/title.wow")
    public String plaTitle() {
        return "plan/title";
    }

    @GetMapping("/title")
    public String planTitle(@RequestParam("planTitle") String planTitle, HttpSession session) throws UnsupportedEncodingException {
            UserVO user = (UserVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login/login.wow";
        } else {
            boolean sameYN = tourService.sameTitle(planTitle, user.getId());
            if (sameYN == false){
             return "/plan/alert";
            }
            tourService.TourPlan(planTitle, user.getId());
            System.out.println(user.getId());
            return "redirect:/plan/plan.wow?planTitle=" + URLEncoder.encode(planTitle,"UTF-8");
        }
    }
}