package com.study.member.web;

import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.service.MailService;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import java.io.IOException;

@Controller
public class MemberFormController {
    private String key;

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
    @RequestMapping(value = "/memberForm/emailCheck", produces = "text/plain;charset=UTF-8")
    public String emailCheck(String email) throws MessagingException {
        key = mailService.mailSend(email);
        return key;
    }

    @ResponseBody
    @RequestMapping(value = "/memberForm/emailCheck2", produces = "text/plain;charset=UTF-8")
    public String emailCheck2(String sendKey) throws MessagingException {
        if (key.equals(sendKey)) {
            return "인증 되었습니다.";
        } else {
            return "인증번호를 확인해주세요.";
        }
    }
}

