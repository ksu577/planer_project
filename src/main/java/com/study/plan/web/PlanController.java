package com.study.plan.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PlanController {

    @GetMapping("plan/plan.wow")
    public String plan_main(Model model){
        return "plan/plan";
    }

    @ResponseBody
    @PostMapping("plan/plan.wow")
    public List<String> plan(@RequestParam List<String> plan_json){
        return plan_json;
    }
}
