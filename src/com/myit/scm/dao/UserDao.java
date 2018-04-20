package com.myit.scm.dao;

import com.myit.scm.entity.User;

public interface UserDao {

	//根据用户名登录
	public User selectOne (String userName, String password);
	
	//添加用户
	public int addOne (User user);
	
	//更新用户信息
	public int updateOne(User user);
	
	//通过username来查询userID
	public int selectIdByName(String username);
}
