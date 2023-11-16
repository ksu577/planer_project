package com.study.login.web;

import com.study.common.util.CookieUtils;
import com.study.login.service.LoginService;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.study.login.dao.ILoginDao;
import java.net.URLEncoder;

import java.io.IOException;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    ILoginDao loginDao;
    @Autowired
    IMemberService memberService;

    @RequestMapping("/login/isLogin.wow")
    public String isLogin() {
        return "login/isLogin";
    }

    @GetMapping("/login/login.wow")
    public String loginGet(Model model, String msg, HttpServletRequest req) throws IOException {
        String id = "";
        String checked = "";

        if (msg == null) {
            msg = "";
        }

        CookieUtils cookieUtils = new CookieUtils(req);

        if (cookieUtils.exists("SAVE_ID")) {
            id = cookieUtils.getValue("SAVE_ID");
            checked = "checked='checked'";
        }
        model.addAttribute("id", id);
        model.addAttribute("checked", checked);
        model.addAttribute("msg", msg);

        return "login/login";
    }


    @PostMapping("/login/login.wow")
    public String loginPost(@RequestParam("Id") String id, @RequestParam("password") String pw
            , String saveId
            , HttpServletRequest req
            , HttpServletResponse response
            , HttpSession session) throws  IOException {

        if (saveId == null) {
            CookieUtils cookieUtils = new CookieUtils(req);
            if (cookieUtils.exists("SAVE_ID")) {
                Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
                response.addCookie(cookie);
            }
            saveId = "";
        }

        if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 입력해주세요.", "utf-8");
        } else {
            UserVO user = loginService.getUser(id);

            if (user == null) {
                return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요.", "utf-8");
            } else {
                if (user.getPassword().equals(pw)) {
                    if (saveId.equals("Y")) {
                        response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
                    }
                    session.setAttribute("USER_INFO", user);
                    return "redirect:/";
                } else {//  비번만 틀린경우
                    return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요.", "utf-8");
                }
            }
        }
    }


    @RequestMapping("/login/logout.wow")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }
}