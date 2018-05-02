package com.myit.scm.dao;

import com.myit.scm.entity.CarDetail;

public interface CarDetailDao {
	
	//通过carid来查询该车辆的详细信息
	public CarDetail selectByCarId (int carId);
}
