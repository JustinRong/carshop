package com.myit.scm.dao;

import com.myit.scm.entity.Dept;

public interface DeptDao {
	
	//���ݱ�Ų�ѯ����
		public Dept selectOne(Integer deptId);
		
		//��Ӳ���
		public int insertDept(Dept dept);
}
