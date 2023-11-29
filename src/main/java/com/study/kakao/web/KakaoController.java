package com.study.kakao.web;

import com.study.cart.service.ICartService;
import com.study.common.vo.ResultMessageVO;
import com.study.login.vo.UserVO;
import com.study.product.service.IproductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;


@Slf4j
@Controller
@RequiredArgsConstructor
public class KakaoController {

    private final IproductService IproductService;

    private final ICartService cartService;

    private final static String HOST = "https://kapi.kakao.com";
    private final static String APP_KEY = "3c757d5ad8df5f534911c2a4f1504def";
    private final static String C_ID = "TC0ONETIME";

    @GetMapping("/test/test.wow")
    public String test() {
        return "test/test";
    }

    @RequestMapping("/test/fail.wow")
    public ModelAndView fail(ModelAndView mv, HttpSession s , RedirectView rv) {
        mv.setViewName("/test/fail");
        return mv;
    }


    @RequestMapping("/test/cancel.wow")
    public ModelAndView cancel(ModelAndView mv, HttpSession s , RedirectView rv) {
        mv.setViewName("/test/cancel");
        return mv;
    }

    @RequestMapping("/test/approval.wow")
    public ModelAndView approval(ModelAndView mv, HttpServletRequest httpServletRequest,
                                 @RequestParam("pg_token") String pgToken
    ) {

        String tid = Arrays.stream(httpServletRequest.getCookies())
                .filter(cookie -> "tid".equals(cookie.getName()))
                .findFirst()
                .get()
                .getValue();

        log.info(tid);

        MultiValueMap<String, Object> data = new LinkedMultiValueMap<>();
        data.add("partner_order_id", "partner_order_id");
        data.add("partner_user_id", "partner_user_id");
        data.add("tid", tid);
        data.add("pg_token", pgToken);

        Map<String, Object> map = approveKakaoPay(data);
        log.info("approve = "+map);
        mv.setViewName("/test/approval");

        return mv;
    }



    @PostMapping("/test/kakaopay.wow")
    @ResponseBody
    public Map<String, Object> kakaopay(HttpSession session, HttpServletResponse httpServletResponse) {

        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();

        int sumMoney = cartService.sumMoney(userId);

        ResultMessageVO msg = new ResultMessageVO();

        MultiValueMap<String, Object> data = new LinkedMultiValueMap<>();
        data.add("partner_order_id", "partner_order_id");
        data.add("partner_user_id", "partner_user_id");
        data.add("item_name", "test");
        data.add("quantity", 1);
        data.add("total_amount", 77800);
        data.add("tax_free_amount", 0);
        data.add("approval_url", "http://localhost:8081/test/approval.wow");
        data.add("fail_url", "http://localhost:8081/test/fail.wow");
        data.add("cancel_url", "http://localhost:8081/test/cancel.wow");

        Map<String, Object> map = readyKakaoPay(data);
        log.info("ready return = "+map);
        log.info("tid = "+map.get("tid"));

        ResponseCookie responseCookie = ResponseCookie
                .from("tid", map.get("tid").toString())
                .path("/")
                .httpOnly(true)
                .maxAge(60 * 3)
                .build();

        httpServletResponse.setHeader(HttpHeaders.SET_COOKIE, responseCookie.toString());

        return map;
    }

    private Map readyKakaoPay(MultiValueMap<String , Object> data) {
        return callKakaoPayAPI("/v1/payment/ready", data);
    }

    private Map approveKakaoPay(MultiValueMap<String, Object> data) {
        return callKakaoPayAPI("/v1/payment/approve", data);
    }

    private Map callKakaoPayAPI(String path, MultiValueMap<String, Object> data) {

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Authorization", "KakaoAK "+ APP_KEY);
        httpHeaders.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
        httpHeaders.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE  + ";charset=UTF-8");

        MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("cid", C_ID);
        params.addAll(data);

        HttpEntity<MultiValueMap<? extends String, ?>> entity
                = new HttpEntity<>(params, httpHeaders);

        RestTemplate restTemplate = new RestTemplate();
        Map<String, Object> map;
        try {
            map = restTemplate.postForObject(new URI(HOST + path), entity, HashMap.class);
            log.info(map.toString());
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }

        return map;
    }
}