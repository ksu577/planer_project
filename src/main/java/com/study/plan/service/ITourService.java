package com.study.plan.service;

import com.study.plan.vo.ShareVO;
import com.study.plan.vo.TourVO;

import java.util.List;

public interface ITourService {
    public void TourPlan(String tourTitle, String user);
    public List<TourVO> myPlan(String user);
    public List<ShareVO> sharePlan(String id);
}
