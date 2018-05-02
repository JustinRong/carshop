package com.myit.scm.service;

import com.myit.scm.entity.CarDetail;

public interface CarDetailService {
	
	//通过carid来查询该车辆的详细信息
	public CarDetail selectByCarId (int carId);
}
