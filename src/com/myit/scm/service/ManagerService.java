package com.myit.scm.service;

import com.myit.scm.entity.Manager;

public interface ManagerService {

  //�����û��˻������¼
  public Manager selectOne(String username,String password);
  
//�޸�����
  public int updatePwdById(String newpwd,int manaId);
}
