package com.myit.scm.dao;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cars;

public interface CarsDao {

	//查询全部或者一个车辆
	public List<Cars> selectAllOrOne(String carBrand);
	
	//通过车id查询
	public Cars selectOneById(int carId);
	
	//通过车id跟车品牌来更新车数量
	public int updateAmountByIdAndBrand(Cars car);
	
	//查询所有汽车
	public List<Cars> selectAllCars();
}
