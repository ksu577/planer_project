package com.study.attach.service;

import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachServiceImpl {
    @Autowired
    public IAttachDao attachDao;

    public AttachVO getAttach(int atchNo){
        return attachDao.getAttach(atchNo);
    }
}
