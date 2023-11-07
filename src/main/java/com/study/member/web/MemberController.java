package com.study.member.web;

import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    IMemberDao memberDao;

    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model) {
        List<MemberVO> memberList = memberDao.getMemberList();
        model.addAttribute("memberList", memberList);
        return "member/memberList";
    }
}