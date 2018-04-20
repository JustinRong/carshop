package com.myit.scm.service;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cars;

public interface CarsService {

	//查询全部或一辆汽车
	public List<Cars> selectAllOrOne(String carBrand);
	
	//通过车id查询
	public Cars selectOneById(int carId);
}
