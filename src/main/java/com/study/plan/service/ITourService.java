package com.study.plan.service;

import com.study.plan.vo.TourVO;

import java.util.List;

public interface ITourService {
    public void TourPlan(TourVO tour);
    public List<TourVO> myPlan(String user);
}
