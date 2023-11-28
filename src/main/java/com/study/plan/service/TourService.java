package com.study.plan.service;

import com.study.plan.dao.ITourDao;
import com.study.plan.vo.TourVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TourService implements ITourService{

    @Autowired
    ITourDao tourDao;

    @Override
    public void TourPlan(String tourTitle, String user) {
        // 쿼리로 불리언 반한 하는 로직으로 변경 하면 좋을것 같음
        String planTitle = tourDao.getPlanTitle(tourTitle);
        if(planTitle == null) {
            tourDao.insertTour(tourTitle, user);
        }
    }

    @Override
    public List<TourVO> myPlan(String user) {
        List<TourVO> myPlanDao = tourDao.myPlanDao(user);
        return myPlanDao;
    }

}
