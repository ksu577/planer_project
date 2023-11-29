package com.study.member.service;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IMemberService {

    public List<MemberVO> getMemberList(PagingVO paging, SearchVO search);
//    public List<MemberVO> getMemberList(String name);
    public MemberVO getMember(String Id) throws BizNotFoundException;
    public void modifyMember(MemberVO member) throws BizException;
    public void removeMember(MemberVO member) throws BizException;
    public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException;
    public List<MemberVO> findId(String name, String email);
    public MemberVO findPw(String id, String email);
    public int findPwCheck(MemberVO member) throws BizException;
    public void changePw(MemberVO member) throws BizException;
    public int findIdCheck(MemberVO member) throws BizException;
    public int findemail(MemberVO member) throws BizException;
}

