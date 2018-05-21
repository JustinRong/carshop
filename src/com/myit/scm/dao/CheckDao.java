package com.myit.scm.dao;

import java.util.List;
import com.myit.scm.entity.Check;

public interface CheckDao {

  //添加信息
  public int insertOne(Check check);
  
  //查询所有问题信息
  public List<Check> selectAll();
  
  //更新修复状态 
  public int updateCheckById(int checkId);
}
