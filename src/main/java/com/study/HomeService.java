package com.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

    final private IDao iDao;

    @Autowired
    public HomeService(IDao iDao) {
        this.iDao = iDao;
    }

    public int dual(){
        return iDao.dual();
    }
}