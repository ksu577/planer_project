package com.study.login.service;

import com.study.login.vo.UserVO;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService {

    @Autowired
    private IMemberDao memberDao;

    public UserVO getUser(String Id) {
        MemberVO member = memberDao.getMember(Id);
        if (member == null) {
            return null;
        }
        else
        {
            String role="MANAGER";

            if(member.getRole() == null) {
                role="USER";
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