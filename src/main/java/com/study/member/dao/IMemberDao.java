package com.study.member.dao;

import com.study.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMemberDao {
    public int getTotalRowCount();
    public List<MemberVO> getMemberList();
    public MemberVO getMember(String Id);
    public int updateMember(MemberVO member);
    public int deleteMember(MemberVO member);
    public int insertMember(MemberVO member);

}
