package com.myit.scm.dao;

import com.myit.scm.entity.Manager;

public interface ManagerDao {

  //�����û��˻������¼
  public Manager selectOne(String username,String password);
  
  //�޸�����
  public int updatePwdById(String newpwd,int manaId);
}
