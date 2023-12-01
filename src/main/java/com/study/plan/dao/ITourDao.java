package com.study.plan.dao;

import com.study.plan.vo.ShareVO;
import com.study.plan.vo.TourVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ITourDao {

    public int insertTour(@Param("tourTitle") String tourTitle, @Param("user") String user);
    public TourVO getTourNum(TourVO tourVO);
    public List<TourVO> myPlanDao(String user);
    public String getPlanTitle(@Param("planTitle") String tourTitle, @Param("user") String user);

    public List<ShareVO> sharePlan(String id);

}
