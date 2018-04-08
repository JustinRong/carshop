package com.myit.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myit.scm.dao.UserDao;
import com.myit.scm.entity.User;
import com.myit.scm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User selectOne(String userName, String password) {
		// TODO Auto-generated method stub
		return userDao.selectOne(userName, password);
	}

	@Override
	public int addOne(User user) {
		// TODO Auto-generated method stub
		return userDao.addOne(user);
	}

}
