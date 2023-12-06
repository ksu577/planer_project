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
    public List<PlanVo> planView(String id, String title) {
        List<PlanVo> planList = planDao.getPlan(id, title);
        return planList;
    }

    @Override
    public List<PlanVo> planMarker(String result, int dayCount, String id) {
        List<PlanVo> planMarkerDao = planDao.planMarkerDao(result, dayCount, id);
        return planMarkerDao;
    }

    @Override
    public void deletePlan(String title, String id) {
        planDao.deletePlan(title, id);
    }

    @Override
    public void updateYn(String title, String id) {
        planDao.planYn(title, id);
    }

    @Override
    public List<PlanVo> topPlan() {
        List<PlanVo> topPlan = planDao.topPlan();
        return topPlan;
    }

    @Override
    public int planCount() {
        int planCount = planDao.planCount();
        return planCount;
    }

}