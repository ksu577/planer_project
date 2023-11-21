package com.study.plan.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.login.vo.UserVO;
import com.study.plan.service.IPlanService;
import com.study.plan.service.ITourService;
import com.study.plan.vo.PlanVo;
import com.study.plan.vo.TourVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
@RequestMapping("/plan")
public class PlanController {


    @Autowired
    IPlanService planService;

    @Autowired
    ITourService tourService;

    Logger logger = LoggerFactory.getLogger(PlanController.class);

    @GetMapping("/plan.wow")
    public String planMain(@RequestParam("planTitle") String title, Model model) {
        System.out.println(title);
        model.addAttribute("title", title);
        return "plan/plan";
    }

    @GetMapping("/marker.wow")
    public String planMarker(@RequestParam("planTitle") String title, Model model, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        System.out.println(title);
        List<PlanVo> planList = planService.planView(user.getId(), title);
        model.addAttribute("planList", planList);
        return "plan/marker";
    }


    @ResponseBody
    @PostMapping("/marker.wow")
    public List<PlanVo> MarkerResult(@RequestParam("title") String title, @RequestParam("result") int result, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        System.out.println(title);
        List<PlanVo> planMarker = planService.planMarker(title, result, user.getId());
        return planMarker;
    }


    @ResponseBody
    @PostMapping("/plan.wow")
    public Object insertPlan(@RequestParam Map<String, Object> parameter, HttpSession session) throws JsonProcessingException {
        System.out.println(parameter.get("plan"));
        String json = parameter.get("plan").toString();
        UserVO user = (UserVO) session.getAttribute("user");

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
                plan.setId(user.getId());
                plan.setPlanHp((String) shopInfoJson.get("planNum"));
                plan.setPlaceName((String) shopInfoJson.get("placeName"));
                plan.setPlaceAddress((String) shopInfoJson.get("placeAddress"));
                plan.setPlaceLoadAddress((String) shopInfoJson.get("placeLoadAddress"));
                plan.setXlab((String) shopInfoJson.get("xlab"));
                plan.setYlab((String) shopInfoJson.get("ylab"));
                plan.setDayCount((Integer) shopInfoJson.get("totalDay"));
                plan.setStartDate((String) shopInfoJson.get("startDate"));
                plan.setEndDate((String) shopInfoJson.get("endDate"));
                plan.setPlanTitle((String) shopInfoJson.get("planTitle"));

                planService.registPlan(plan);
            }
        }

        return parameter.get("plan");
    }

    @GetMapping("/myPlan.wow")
    public String myplan(@RequestParam("user") String user, Model model) {
        List<TourVO> myPlan = tourService.myPlan(user);
        model.addAttribute("myPlan", myPlan);
        return "plan/myPlan";
    }


    @GetMapping("/planDelete.wow")
    public String planDelete(@RequestParam("title") String title, HttpSession session){
        UserVO user = (UserVO) session.getAttribute("user");
        planService.deletePlan(title, user.getId());
        return "redirect:/plan/myPlan.wow?user="+ user.getId();
    }

}
