package com.study.login.service;

import com.study.login.vo.UserVO;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService {

    @Autowired
    private  IMemberDao memberDao;

    public UserVO getUser(String Id) {
        MemberVO member = memberDao.getMember(Id);
        System.out.println(member);
        if (member == null) {
            return null;
        } else {
            String role="USER";
            if(member.getId().equals("admin")){
                role="MANAGER";
            }
            UserVO user = new UserVO(
                    member.getId()
                    , member.getName()
                    , member.getPassword()
                    , role);
            return user;
        }
    }

}