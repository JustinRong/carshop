package com.myit.scm.service;

import com.myit.scm.entity.Dept;

public interface DeptService {

	//���ݱ�Ų�ѯ����
	public Dept selectOne(Integer deptId);
	
	//��Ӳ���
	public int insertDept(Dept dept);
}
