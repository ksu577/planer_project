package com.study.plan.dao;

import com.study.plan.vo.ShareVO;
import com.study.plan.vo.TourVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShareDao {
    int insertShare(ShareVO shareVO);
}
