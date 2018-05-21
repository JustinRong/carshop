package com.myit.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myit.scm.dao.ManagerDao;
import com.myit.scm.entity.Manager;

import com.myit.scm.service.ManagerService;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

  @Autowired
  private ManagerDao managerDao;
  
  @Override
  public Manager selectOne(String username, String password) {
    // TODO Auto-generated method stub
    return managerDao.selectOne(username, password);
  }

  @Override
  public int updatePwdById(String newpwd, int manaId) {
    // TODO Auto-generated method stub
    return managerDao.updatePwdById(newpwd, manaId);
  }

}
