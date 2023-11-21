package com.study.plan.dao;

import com.study.plan.vo.TourVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ITourDao {

    public int insertTour(TourVO tourVO);
    public TourVO getTourNum(TourVO tourVO);
    public List<TourVO> myPlanDao(String user);

}
