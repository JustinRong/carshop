package com.myit.scm.service;

import com.myit.scm.entity.User;

public interface UserService {

	public User selectOne (String userName, String password);
	
	//����û�
	public int addOne (User user);
	
	//�����û���Ϣ
	public int updateOne(User user);
	
	//ͨ��username����ѯuserID
	public int selectIdByName(String username);
}
