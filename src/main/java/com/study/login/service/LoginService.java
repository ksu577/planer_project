package com.study.login.service;

import com.study.login.vo.UserVO;
import com.study.member.IMemberDao;
import com.study.member.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService {

    @Autowired
    private  IMemberDao memberDao;
    public UserVO getUser(String memId) {
        MemberVO member = memberDao.getMember(memId);
        if (member == null) {
            return null;
        } else {
            //간단하게 특정아이디 하나만 MANAGER로 지정합시다.
            String role="USER";
            if(member.getId().equals("next6")){
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