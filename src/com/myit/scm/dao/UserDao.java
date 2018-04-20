package com.myit.scm.dao;

import com.myit.scm.entity.User;

public interface UserDao {

	//�����û�����¼
	public User selectOne (String userName, String password);
	
	//����û�
	public int addOne (User user);
	
	//�����û���Ϣ
	public int updateOne(User user);
	
	//ͨ��username����ѯuserID
	public int selectIdByName(String username);
}
