package com.study.member.service;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.exception.BizNotEffectedException;
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
    public List<MemberVO> getMemberList(PagingVO paging, SearchVO search) {
        int totalRowCount = memberDao.getTotalRowCount(paging, search);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<MemberVO> memberList = memberDao.getMemberList(paging, search);

        return memberList;
    }

    @Override
    public MemberVO getMember(String Id) throws BizNotFoundException {
        MemberVO member = memberDao.getMember(Id);
        if (member == null) throw new BizNotFoundException();
        return member;
    }

    @Override
    public void modifyMember(MemberVO member) throws BizNotEffectedException {
        int count = memberDao.updateMember(member);
        if (count < 1) throw new BizNotEffectedException();
    }

    @Override
    public void removeMember(MemberVO member /* member = 유저가 쓴 아이디 */ ) throws BizNotEffectedException, BizNotFoundException {
        MemberVO DBmember = memberDao.getMember(member.getId());
        if (DBmember == null) throw new BizNotFoundException();
        if (!DBmember.getPassword().equals(member.getPassword())) throw new BizNotEffectedException();
        int count = memberDao.deleteMember(member);
        if (count < 1) throw new BizNotEffectedException();
    }


    @Override
    public void registMember(MemberVO member /* member = 유저가 쓴 아이디 */) throws BizNotEffectedException {
        int count = memberDao.insertMember(member);
        if (count < 1) throw new BizNotEffectedException();
    }

    @Override
    public List<MemberVO> findId(String name, String email) {
        List<MemberVO> result = null;
        try {
            result = memberDao.findId(name, email);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result ;
    }
}
