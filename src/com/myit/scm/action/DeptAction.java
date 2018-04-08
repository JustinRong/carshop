package com.myit.scm.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myit.scm.entity.Dept;
import com.myit.scm.service.DeptService;

@Controller
@RequestMapping(value="/dept")
public class DeptAction {
	
	@Resource
	private DeptService deptService;
	
	@RequestMapping(value="/insert")
	public String insertDept(Dept dept){
		System.out.println(dept);
		deptService.insertDept(dept);
		return "/jsp/main.jsp";
	}
}
