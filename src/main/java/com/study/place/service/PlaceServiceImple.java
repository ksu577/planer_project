package com.study.place.service;

import com.study.place.dao.PlaceDao;
import com.study.place.vo.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceServiceImple implements PlaceService {

    @Autowired
    PlaceDao placeDao;

    @Override
    public List<PlaceVO> getplaceList(String search) {
        return placeDao.getplaceList(search);
    }

    @Override
    public PlaceVO getplace(int placeNum) {
        return placeDao.getplace(placeNum);
    }
}
