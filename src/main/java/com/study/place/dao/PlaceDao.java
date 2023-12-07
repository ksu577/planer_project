package com.study.place.dao;

import com.study.place.vo.PlaceVO;
import org.apache.ibatis.annotations.Mapper;

import java.awt.*;
import java.util.List;


@Mapper
public interface PlaceDao {


    // 1. 리스트
    public List<PlaceVO> getplaceList(String search);

    // 2. 세부사항
    public PlaceVO getplace(int placeNum);


}
