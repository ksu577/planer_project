package com.study.plan.service;

import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import com.study.plan.dao.ShareDao;
import com.study.plan.vo.PlanVo;
import com.study.plan.vo.ShareVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShareService {
    @Autowired
    ShareDao shareDao;

    @Autowired
    IMemberDao memberDao;

    public int sharePlan(ShareVO shareVO) {
        int shareInsertService = shareDao.insertShare(shareVO);
        return shareInsertService;
    }
}
