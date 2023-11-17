package com.study.plan.dao;

import com.study.plan.vo.TourVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ITourDao {

    public int insertTour(TourVO tourVO);
    public TourVO getTourNum(TourVO tourVO);

}
