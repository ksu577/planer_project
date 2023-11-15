package com.study.plan.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.plan.service.IPlanService;
import com.study.plan.vo.PlanVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@Controller
@RequestMapping("/plan")
public class PlanController {


    @Autowired
    IPlanService planService;

    Logger logger = LoggerFactory.getLogger(PlanController.class);

    @GetMapping("/plan.wow")
    public String planMain(Model model) {
        return "plan/plan";
    }

    @GetMapping("marker.wow")
    public String planMarker(Model model){
        List<PlanVo> planList = planService.planView();
        model.addAttribute("planList", planList);
        return "plan/marker";
    }


    @ResponseBody
    @PostMapping("/plan.wow")
    public Object insertPlan(@RequestParam Map<String, Object> parameter) throws JsonProcessingException {
        System.out.println(parameter.get("plan"));
        String json = parameter.get("plan").toString();

        /* playerList로 넘어온 데이터를 문자열로 변환 */
        ObjectMapper mapper = new ObjectMapper();
        //변환된 데이터를 List형태에 저장
        //JSON 파일을 Java 객체로 deserialization 하기 위해서 ObjectMapper의 readValue() 메서드를 이용
        List<List<Map<String, Object>>> planList = mapper.readValue(json, new TypeReference<>() {
        });


        for (int i = 1; i < planList.size(); i++) {
//            n일차 가게
            List<Map<String, Object>> nShopList = planList.get(i);
            for (int j = 0; j < nShopList.size(); j++) {
                Map<String, Object> shopInfoJson = nShopList.get(j);
                System.out.println(shopInfoJson.get("placeName"));

                PlanVo plan = new PlanVo();
                plan.setPlanNum((String) shopInfoJson.get("planNum"));
                plan.setPlaceName((String) shopInfoJson.get("placeName"));
                plan.setPlaceAddress((String) shopInfoJson.get("placeAddress"));
                plan.setPlaceLoadAddress((String) shopInfoJson.get("placeLoadAddress"));
                plan.setXlab((String) shopInfoJson.get("xlab"));
                plan.setYlab((String) shopInfoJson.get("ylab"));
                plan.setTotalDay((Integer) shopInfoJson.get("totalDay"));
                plan.setStartDate((String) shopInfoJson.get("startDate"));
                plan.setEndDate((String) shopInfoJson.get("endDate"));

                planService.registMember(plan);
            }
        }

        return parameter.get("plan");
    }
}