package com.study.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
public class MailService {
    @Autowired
    JavaMailSenderImpl mailSender;
    public String mailSend(String email) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        String randomKey = getRandom();
        mimeMessage.setSubject("[순자산 3조] 회원가입 인증번호");
        mimeMessage.setText("안녕하세요. 순자산 3조 입니다. \n 회원가입 인증번호를 발급해드립니다. \n 인증번호는 5분 동안 유효합니다. \n -----------------------------------------------" +
                "\n"+ randomKey + "\n-----------------------------------------------\n 고객님 본인이 요청하신 것이 아닌 경우, 고객센터로 문의 바랍니다. \n 감사합니다.");
        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        mailSender.send(mimeMessage);
        return randomKey;
    }

    public String mailSend2(String email) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        String randomKey = getRandom();
//        mimeMessage.setSubject("[순자산 3조] 아이디 찾기 인증번호");
//        mimeMessage.setText("안녕하세요. 순자산 3조 입니다. \n 아이디 찾기 인증번호를 발급해드립니다. \n" + randomKey);
//        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
//        mailSender.send(mimeMessage);
        return randomKey;
    }

    public String mailSend3(String email) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        String randomKey = getRandom();
//        mimeMessage.setSubject("[순자산 3조] 비밀번호 찾기 인증번호");
//        mimeMessage.setText("안녕하세요. 순자산 3조 입니다. \n 비밀번호 찾기 인증번호를 발급해드립니다. \n" + randomKey);
//        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
//        mailSender.send(mimeMessage);
        return randomKey;
    }


    private String getRandom() {
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 6; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
}
