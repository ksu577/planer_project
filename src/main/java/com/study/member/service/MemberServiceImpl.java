package com.study.member.service;

import com.study.member.dao.IMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl {

    @Autowired
    IMemberDao memberDao;

//    @Override
//    public List<MemberVO> getMemberList() {
//        List<MemberVO> memberList = memberDao.getMemberList();
//        return memberList;
//    }

}
