package com.study.plan.service;

import com.study.plan.dao.IExelDao;
import com.study.plan.vo.PlanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExelService {

    @Autowired
    IExelDao exelDao;

    public List<PlanVo> getPlanExel(String title, String id){
        List<PlanVo> planExelDao = exelDao.planExel(title, id);
        return planExelDao;
    }
}
