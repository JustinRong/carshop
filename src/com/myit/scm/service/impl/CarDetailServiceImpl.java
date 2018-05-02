package com.myit.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myit.scm.dao.CarDetailDao;
import com.myit.scm.entity.CarDetail;
import com.myit.scm.service.CarDetailService;

@Service("carDetailService")
public class CarDetailServiceImpl implements CarDetailService {
	
	@Autowired
	private CarDetailDao carDetailDao;

	@Override
	public CarDetail selectByCarId(int carId) {
		// TODO Auto-generated method stub
		return carDetailDao.selectByCarId(carId);
	}

}
