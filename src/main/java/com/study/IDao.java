package com.study;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao {
    public int dual();
}
