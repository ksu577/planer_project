package com.study.attach.dao;

import com.study.attach.vo.AttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAttachDao {
    public int insertAttach(AttachVO attach);

    public List<AttachVO> getAttachListByParent(@Param("atchCategory") String atchCategory,@Param("atchParentNo")int atchParentNo);

    public int delAtchNos(@Param("delAtchNos") int[] delAtchNos);

    public AttachVO getAttach(int getAttach);

}
