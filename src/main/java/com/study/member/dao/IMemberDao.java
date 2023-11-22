package com.study.member.dao;

import com.study.common.vo.PagingVO;

import com.study.common.vo.SearchVO;
import com.study.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import java.util.List;

@Mapper
public interface IMemberDao {
    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
    public List<MemberVO> getMemberList(@Param("paging") PagingVO paging, @Param("search") SearchVO search);
    public MemberVO getMember(String Id);
    public int updateMember(MemberVO member);
    public int deleteMember(MemberVO member);
    public int insertMember(MemberVO member);

    @Select("select nvl(id, 0) from member where name=#{name} and email=#{email}")
    public String findId(@Param("name") String name, @Param("email") String email);
}