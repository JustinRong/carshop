package com.myit.scm.service;

import java.util.List;
import com.myit.scm.entity.Check;

public interface CheckService {

  //�����Ϣ
  public int insertOne(Check check);
  
//��ѯ����������Ϣ
  public List<Check> selectAll();
  
//�����޸�״̬ 
  public int updateCheckById(int checkId);
}
