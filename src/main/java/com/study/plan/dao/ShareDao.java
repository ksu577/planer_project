package com.study.plan.dao;

import com.study.plan.vo.ShareVO;
import com.study.plan.vo.TourVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ShareDao {
    int insertShare(ShareVO shareVO);

    int memberCheck(ShareVO shareVO);

    int checkAlready(ShareVO shareVO);

    void shareDelDao(@Param("id") String id, @Param("title") String planTitle, @Param("shareId") String shareId);
}
