package com.study.plan.dao;

import com.study.member.vo.MemberVO;
import com.study.plan.vo.PlanVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlanDao {
    public int insertPlan(PlanVo plan);

    public List<PlanVo> getPlan();
}
