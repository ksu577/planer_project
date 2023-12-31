package com.study.login.web;

import com.study.login.service.LoginService;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;

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
    LoginService loginService;
    @Autowired
    ILoginDao loginDao;
    @Autowired
    IMemberService memberService;

    @GetMapping("/login/login.wow")
    public String loginGet(Model model, String msg) throws IOException {
        model.addAttribute("msg", msg);
        return "login/login";
    }

    @PostMapping("/login/login.wow")
    public String loginPost(@ModelAttribute("memberVO") MemberVO member, HttpSession session) throws IOException {

        String Id = member.getId();
        String pw = member.getPassword();
        UserVO user = loginService.getUser(Id);

        if (user == null) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요.", "utf-8");
        } else {
            if (!user.getPassword().equals(pw)) {
                return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요.", "utf-8");
            } else {
                session.setAttribute("user", user);
                return "redirect:/";
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
        String Id = memberVO.getId();
//        MemberVO member = memberService.getMember(Id);
//        session.setAttribute("member", member);
        return "member/memberForm";
    }
}