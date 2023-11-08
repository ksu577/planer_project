package com.study.member.web;

import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberFormController {

    @Autowired
    private IMemberService memberService;

    @ResponseBody
    @RequestMapping(value = "/memberForm/idCheck", produces = "text/plain;charset=UTF-8")
    public String idCheck(String id) {
        try {
            MemberVO member = memberService.getMember(id);
            return "중복된 아이디 입니다.";
        } catch (BizNotFoundException e) {
            return "사용 가능한 아이디 입니다.";
        }
    }
}
