package com.study.plan.dao;

import com.study.member.vo.MemberVO;
import com.study.plan.vo.PlanVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PlanDao {
    public int insertPlan(PlanVo plan);
    public List<PlanVo> getPlan(@Param("id") String id,@Param("title") String title);
    public List<PlanVo> planMarkerDao(@Param("title")String title,@Param("dayCount") int dayCount, @Param("id") String id);
    public int deletePlan(@Param("title") String title, @Param("id") String id);

}
