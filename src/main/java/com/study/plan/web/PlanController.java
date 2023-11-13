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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/plan")
public class PlanController {


    @Autowired
    IPlanService planService;

    Logger logger = LoggerFactory.getLogger(PlanController.class);

    @GetMapping("/plan.wow")
    public String plan_main(Model model) {
        return "plan/plan";
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
        List<List<Map<String, Object>>> planList = mapper.readValue(json, new TypeReference<List<List<Map<String, Object>>>>() {
        });

        for (int i = 1; i < planList.size(); i++) {
            List<Map<String, Object>> n일차가게List = planList.get(i);
            for (int j = 0; j < n일차가게List.size(); j++) {
                Map<String, Object> 가게정보json = n일차가게List.get(j);
                System.out.println(가게정보json.get("placeName"));

                PlanVo plan = new PlanVo();
                plan.setPlanNum((String) 가게정보json.get("planNum"));
                plan.setPlaceName((String) 가게정보json.get("placeName"));
                plan.setPlaceAddress((String) 가게정보json.get("placeAddress"));
                plan.setPlaceLoadAddress((String) 가게정보json.get("placeLoadAddress"));
                planService.registMember(plan);
            }
        }

        return parameter.get("plan");
    }
}