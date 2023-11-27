package com.study.place.service;

import com.study.place.vo.PlaceVO;

import java.util.List;

public interface PlaceService {

    //1. 목록
    public List<PlaceVO> getplaceList(PlaceVO placeVO);

    //2. 상세
    public PlaceVO getplace(int placeNum);

}
