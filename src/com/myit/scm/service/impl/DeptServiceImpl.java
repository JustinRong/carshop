package com.myit.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myit.scm.dao.DeptDao;
import com.myit.scm.entity.Dept;
import com.myit.scm.service.DeptService;

@Service("deptService")
public class DeptServiceImpl implements DeptService {
	
	@Autowired
	private DeptDao deptDao;
	
	@Override
	public Dept selectOne(Integer deptId) {
		// TODO Auto-generated method stub
		return deptDao.selectOne(deptId);
	}

	@Override
	public int insertDept(Dept dept) {
		// TODO Auto-generated method stub
		return deptDao.insertDept(dept);
	}

}
