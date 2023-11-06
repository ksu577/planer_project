package com.study.member;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMemberDao {
    public int getTotalRowCount();
    public List<MemberVO> getMemberList();
    public MemberVO getMember(String memId);
    public int updateMember(MemberVO member);
    public int deleteMember(MemberVO member);
    public int insertMember(MemberVO member);

}
