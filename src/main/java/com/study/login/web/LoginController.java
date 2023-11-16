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
    public String loginPost(@ModelAttribute("memberVO") MemberVO memberVO, String saveId, HttpServletRequest req, HttpServletResponse response, HttpSession session) throws  IOException {

        String Id=memberVO.getId();
        String pw=memberVO.getPassword();

        UserVO user = loginService.getUser(Id);

        if (saveId == null) {
            CookieUtils cookieUtils = new CookieUtils(req);
            if (cookieUtils.exists("SAVE_ID")) {
                Cookie cookie = CookieUtils.createCookie("SAVE_ID", Id, "/", 0);
                response.addCookie(cookie);
            }
            saveId = "";
        }

        if ((Id == null) || (pw == null)) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 입력해주세요.", "utf-8");
        } else {
            if (user == null) {
                return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요.", "utf-8");
            } else {
                if (user.getPassword().equals(pw)) {
                    if (saveId.equals("Y")) {
                        response.addCookie(CookieUtils.createCookie("SAVE_ID", Id, "/", 3600 * 24 * 7));
                    }
                    session.setAttribute("user", user);
                    return "redirect:/";
                } else {
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

    @RequestMapping("/member/memberForm.wow")
    public String memberForm(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession session) throws Exception {
        String Id=memberVO.getId();
        String pw=memberVO.getPassword();
        MemberVO member = memberService.getMember(Id);
        session.setAttribute("member", member);
        return "member/memberForm";
    }
}