package com.study.plan.service;

import com.study.plan.dao.PlanDao;
import com.study.plan.vo.PlanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanService implements IPlanService {

    @Autowired
    PlanDao planDao;

    @Override
    public void registPlan(PlanVo plan) {
        planDao.insertPlan(plan);
    }

    @Override
    public List<PlanVo> planView(String id) {
        List<PlanVo> planList = planDao.getPlan(id);
        return planList;
    }

    @Override
    public List<PlanVo> planMarker(int dayCount, String id){
        List<PlanVo> planMarkerDao = planDao.planMarkerDao(dayCount, id);
        return planMarkerDao;
    }


}