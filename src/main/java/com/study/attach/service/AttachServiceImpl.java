package com.study.attach.service;

import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachServiceImpl {
    @Autowired
    public IAttachDao attachDao;

    public AttachVO getAttach(int atchNo) {
        try {
            return attachDao.getAttach(atchNo);
        } catch (Exception e) {
            // 예외가 발생한 경우 로그를 남기고 null을 반환하거나 적절한 예외를 던질 수 있습니다.
            // 여기서는 간단히 null을 반환하도록 하겠습니다.
            e.printStackTrace(); // 나중에는 로깅 프레임워크를 사용하는 것이 좋습니다.
            return null;
        }
    }
}
