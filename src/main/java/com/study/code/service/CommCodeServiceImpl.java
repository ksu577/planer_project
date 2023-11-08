package com.study.code.service;


import com.study.code.dao.ICommCodeDao;
import com.study.code.vo.CodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommCodeServiceImpl  implements  ICommCodeService{

    @Autowired
    ICommCodeDao codeDao;

    @Override
    public List<CodeVO> getCodeListByParent(String parentCode) {
            return codeDao.getCodeListByParent(parentCode);
    }


}
