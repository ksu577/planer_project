package com.study.kakao.web;

import com.study.cart.service.ICartService;
import com.study.cart.vo.CartVO;
import com.study.common.vo.ResultMessageVO;
import com.study.kakao.service.KakaoService;
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
import java.util.List;
import java.util.Map;


@Slf4j
@Controller
@RequiredArgsConstructor
public class KakaoController {

    private final KakaoService kakaoService;


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
    public String approval(HttpSession session,
                                 HttpServletRequest httpServletRequest,
                                 @RequestParam("pg_token") String pgToken

    ) {

        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();

        String tid = Arrays.stream(httpServletRequest.getCookies())
                .filter(cookie -> "tid".equals(cookie.getName()))
                .findFirst()
                .get()
                .getValue();

        kakaoService.approval(pgToken, tid, userId);

        return "redirect:/shop/afterpay.wow";
    }



    @PostMapping("/test/kakaopay.wow")
    @ResponseBody
    public Map<String, Object> kakaopay(HttpSession session, HttpServletResponse httpServletResponse) {

        UserVO user = (UserVO) session.getAttribute("user");
        String userId = user.getId();

        Map<String, Object> map = kakaoService.ready(userId);

        if(map == null) {
            return null;
        }

        ResponseCookie responseCookie = ResponseCookie
                .from("tid", map.get("tid").toString())
                .path("/")
                .httpOnly(true)
                .maxAge(60 * 5)
                .build();

        httpServletResponse.setHeader(HttpHeaders.SET_COOKIE, responseCookie.toString());

        return map;
    }



}