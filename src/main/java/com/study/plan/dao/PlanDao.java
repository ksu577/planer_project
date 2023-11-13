package com.study.plan.dao;

import com.study.member.vo.MemberVO;
import com.study.plan.vo.PlanVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PlanDao {
    public int insertPlan(PlanVo plan);
}
