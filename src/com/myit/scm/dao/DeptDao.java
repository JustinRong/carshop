package com.myit.scm.dao;

import com.myit.scm.entity.Dept;

public interface DeptDao {
	
	//根据编号查询部门
		public Dept selectOne(Integer deptId);
		
		//添加部门
		public int insertDept(Dept dept);
}
