package com.study.member.service;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;
import java.util.List;

public interface IMemberService {

    public List<MemberVO> getMemberList(PagingVO paging, SearchVO search);
    public MemberVO getMember(String Id) throws BizNotFoundException;
    public void modifyMember(MemberVO member) throws BizException;
    public void removeMember(MemberVO member) throws BizException;
    public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException;
    public List<MemberVO> findId(String name, String email);
}

