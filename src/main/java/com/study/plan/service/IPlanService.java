package com.study.plan.service;

import com.study.plan.vo.PlanVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IPlanService {
    public void registPlan(PlanVo plan);
    public List<PlanVo> planView(String id);
    public List<PlanVo> planMarker(@Param("dayCount") int dayCount, @Param("id") String id);
}
