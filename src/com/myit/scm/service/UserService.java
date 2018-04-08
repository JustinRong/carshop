package com.myit.scm.service;

import com.myit.scm.entity.User;

public interface UserService {

	public User selectOne (String userName, String password);
	
	//ÃÌº””√ªß
	public int addOne (User user);
}
