package com.study.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
    @RequestMapping("/plan/plan.wow")
    public String plan(Model model){
        return "/plan/plan";
    }
}
