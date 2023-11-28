package com.study.plan.dao;

import com.study.plan.vo.PlanVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IExelDao {
    List<PlanVo> planExel(@Param("title") String title, @Param("id") String id);
}
