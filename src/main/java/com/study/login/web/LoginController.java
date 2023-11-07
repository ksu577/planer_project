package com.study.login.web;

import com.study.login.service.LoginService;
import com.study.login.vo.UserVO;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.study.login.dao.ILoginDao;

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

        if(user==null) return "redirect:/login/login.wow";
        else {
            if(!user.getPassword().equals(pw)) {
                return "redirect:/login/login.wow";
            } else {
                session.setAttribute("user", user);
                return "redirect:/login/isLogin.wow";
            }
        }
    }


    @RequestMapping("/login/logout.wow")
    public String logout(HttpSession session) {
        session.removeAttribute("MEMBER");
        return "redirect:/login/isLogin.wow";
    }


    @RequestMapping("/member/memberForm.wow")
    public String memberForm() {
        return "member/memberForm";
    }

    @RequestMapping("/member/memberRegist.wow")
    public String memberRegist(MemberVO member) {
        loginDao.insertMember(member);
        return "redirect:/login/isLogin.wow";
    }


}