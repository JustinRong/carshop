package com.myit.scm.dao;

import java.util.List;
import com.myit.scm.entity.Check;

public interface CheckDao {

  //�����Ϣ
  public int insertOne(Check check);
  
  //��ѯ����������Ϣ
  public List<Check> selectAll();
  
  //�����޸�״̬ 
  public int updateCheckById(int checkId);
}
