package com.myit.scm.dao;

import com.myit.scm.entity.CarDetail;

public interface CarDetailDao {
	
	//ͨ��carid����ѯ�ó�������ϸ��Ϣ
	public CarDetail selectByCarId (int carId);
}
