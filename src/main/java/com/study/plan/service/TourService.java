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
    public void TourPlan(TourVO tour) {
        tourDao.insertTour(tour);
    }

    @Override
    public List<TourVO> myPlan(String user) {
        List<TourVO> myPlanDao = tourDao.myPlanDao(user);
        return myPlanDao;
    }
}
