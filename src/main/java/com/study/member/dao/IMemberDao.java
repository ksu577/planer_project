package com.study.member.dao;

import com.study.common.vo.PagingVO;

import com.study.common.vo.SearchVO;
import com.study.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import java.lang.reflect.Member;
import java.util.List;

@Mapper
public interface IMemberDao {
    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
    public List<MemberVO> getMemberList(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
    public MemberVO getMember(String Id);
    public int updateMember(MemberVO member);
    public int deleteMember(MemberVO member);
    public int insertMember(MemberVO member);
    public List<MemberVO> findId(@Param("name") String name, @Param("email") String email);
    public MemberVO findPw(@Param("Id") String id, @Param("email") String email);
    public int changePw(MemberVO member);
    public int findIdCheck(MemberVO member);
    public int findPwCheck(MemberVO member);
}