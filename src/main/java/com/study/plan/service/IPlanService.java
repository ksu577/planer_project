package com.study.plan.service;

import com.study.plan.vo.PlanVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IPlanService {
    public void registPlan(PlanVo plan);

    public List<PlanVo> planView(String id, String title);

    public List<PlanVo> planMarker(String result, int dayCount, String id);

    public void deletePlan(String title, String id);

    public void updateYn(String title, String id);
}
