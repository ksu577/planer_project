package com.study.login.web;

import com.study.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.login.dao.ILoginDao;
import com.study.member.MemberVO;

@Controller
public class LoginController {
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
    public String loginPost(String id, String pw, HttpSession session) {
        MemberVO member=loginDao.getMember(id);
        if(member==null) return "redirect:/login/login.wow";
        else {
            if(!member.getPassword().equals(pw)) {
                return "redirect:/login/login.wow";
            }else {
                session.setAttribute("MEMBER", member);
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
        return "login/memberForm";
    }

    @RequestMapping("/member/memberRegist.wow")
    public String memberRegist(MemberVO member) {
        loginDao.insertMember(member);
        return "redirect:/login/isLogin.wow";
    }


}