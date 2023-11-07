package com.study.member.service;

import com.study.exception.BizException;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

import java.util.List;

public interface IMemberService {
    public List<MemberVO> getMemberList();
    public MemberVO getMember(String Id) throws BizNotFoundException;
    public void modifyMember(MemberVO memberVO) throws BizException;
    public void removeMember(MemberVO memberVO) throws BizException;
    public void registMember(MemberVO memberVO) throws BizException;
}
