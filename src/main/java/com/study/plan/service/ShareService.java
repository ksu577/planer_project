package com.study.plan.service;

import com.study.exception.BizNotEffectedException;
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

//    public int sharePlan(ShareVO shareVO) {
//        int shareInsertService = shareDao.insertShare(shareVO);
//        return shareInsertService;
//    }

    public String sharePlanY(ShareVO shareVO) throws Exception{

        int memberCheck = shareDao.memberCheck(shareVO);
        int checkAlready = shareDao.checkAlready(shareVO);


        if (checkAlready == 0) {
            if (memberCheck != 1) {
                return "없는 아이디입니다";
            }
            if (shareVO.getId().equals(shareVO.getShareId())){
                return "본인은 공유할 수 없습니다";
            }
            int shareInsertService = shareDao.insertShare(shareVO);
            if (shareInsertService != 1) {
                throw new BizNotEffectedException();
            }
            return "공유에 성공하였습니다!";
        }

        return "이미 공유된 사람입니다";

    }

    public void shareDel(String id, String planTitle, String shareId) {
        shareDao.shareDelDao(id, planTitle, shareId);
    }
}
