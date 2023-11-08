package com.study.login.web;

import com.study.login.service.LoginService;
import com.study.login.vo.UserVO;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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

    @RequestMapping("/login/isLogin.wow")
    public String isLogin() {
        return "login/isLogin";
    }

    @GetMapping("/login/login.wow")
    public String loginGet() {
        return "login/login";
    }
    @PostMapping("/login/login.wow")
    public String loginPost(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession session) throws Exception{


        String Id=memberVO.getId();
        String pw=memberVO.getPassword();

        UserVO user = loginService.getUser(Id);


        if(user==null) return "redirect:/login/login.wow?login_error=" + URLEncoder.encode("아이디와 비밀번호를 입력하세요.", "utf-8");
        else {
            if(!user.getPassword().equals(pw)) {
                return "redirect:/login/login.wow?login_error=" +URLEncoder.encode("비밀번호가 다릅니다.","utf-8");
            } else {
                session.setAttribute("USER_INFO", user);
                return "redirect:/login/isLogin.wow";
            }
        }
    }




    @RequestMapping("/login/logout.wow")
    public String logout(HttpSession session) {
        session.removeAttribute("USER_INFO");
        return "redirect:/login/isLogin.wow";
    }


    @RequestMapping("/member/memberForm.wow")
    public String memberForm(@ModelAttribute("memberVO") MemberVO member, HttpSession session) throws Exception {
        return "member/memberForm";
    }

    @RequestMapping("/member/memberRegist.wow")
    public String memberRegist(MemberVO member) {
        loginDao.insertMember(member);
        return "redirect:/login/isLogin.wow";
    }




}