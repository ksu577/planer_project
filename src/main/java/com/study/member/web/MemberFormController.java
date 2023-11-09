package com.study.member.web;

import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.service.MailService;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;

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
            if (id.length() < 4) {
                return "최소 4글자 이상 입력해주세요.";
            } else {
                return "사용 가능한 아이디 입니다.";
            }
        }
    }

    @Autowired
    private MailService mailService;

    @ResponseBody
    @RequestMapping(value = "/memberForm/emailCheck")
    public String emailCheck(String email) throws MessagingException {
        return mailService.mailSend(email);
    }
}
