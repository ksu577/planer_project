package com.study.plan.service;

import com.study.plan.dao.PlanDao;
import com.study.plan.vo.PlanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlanService implements IPlanService {

    @Autowired
    PlanDao planDao;

    @Override
    public void registMember(PlanVo plan) {
        int count = planDao.insertPlan(plan);
    }
}
