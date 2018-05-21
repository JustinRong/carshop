package com.myit.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myit.scm.dao.CheckDao;
import com.myit.scm.entity.Check;
import com.myit.scm.service.CheckService;

@Service("checkService")
public class CheckServiceImpl implements CheckService {
  
  @Autowired
  private CheckDao checkDao;

  @Override
  public int insertOne(Check check) {
    // TODO Auto-generated method stub
    return checkDao.insertOne(check);
  }

  @Override
  public List<Check> selectAll() {
    // TODO Auto-generated method stub
    return checkDao.selectAll();
  }

  @Override
  public int updateCheckById(int checkId) {
    // TODO Auto-generated method stub
    return checkDao.updateCheckById(checkId);
  }

}
