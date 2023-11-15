package com.study.plan.service;

import com.study.plan.vo.PlanVo;

import java.util.List;

public interface IPlanService {
    public void registMember(PlanVo plan);
    public List<PlanVo> planView();
}
