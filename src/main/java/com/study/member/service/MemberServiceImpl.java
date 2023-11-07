package com.study.member.service;

import com.study.exception.BizException;
import com.study.exception.BizNotFoundException;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements IMemberService{

    @Autowired
    IMemberDao memberDao;

    @Override
    public List<MemberVO> getMemberList() {
        return null;
    }

    @Override
    public MemberVO getMember(String Id) throws BizNotFoundException {
        return null;
    }

    @Override
    public void modifyMember(MemberVO memberVO) throws BizException {

    }

    @Override
    public void removeMember(MemberVO memberVO) throws BizException {

    }

    @Override
    public void registMember(MemberVO memberVO) throws BizException {

    }

//    @Override
//    public List<MemberVO> getMemberList() {
//        List<MemberVO> memberList = memberDao.getMemberList();
//        return memberList;
//    }

}
