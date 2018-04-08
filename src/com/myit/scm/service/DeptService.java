package com.myit.scm.service;

import com.myit.scm.entity.Dept;

public interface DeptService {

	//根据编号查询部门
	public Dept selectOne(Integer deptId);
	
	//添加部门
	public int insertDept(Dept dept);
}
