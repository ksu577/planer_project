package com.study.login.dao;

import com.study.member.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ILoginDao {
    public MemberVO getMember(String memId);
    public int insertMember(MemberVO member);
}