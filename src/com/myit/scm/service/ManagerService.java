package com.myit.scm.service;

import com.myit.scm.entity.Manager;

public interface ManagerService {

  //根据用户账户密码登录
  public Manager selectOne(String username,String password);
  
//修改密码
  public int updatePwdById(String newpwd,int manaId);
}
