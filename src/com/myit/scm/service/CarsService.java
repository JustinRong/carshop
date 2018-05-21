package com.myit.scm.service;

import java.util.List;

import com.myit.scm.entity.Cars;

public interface CarsService {

	//查询全部或一辆汽车
	public List<Cars> selectAllOrOne(String carBrand);
	
	//通过车id查询
	public Cars selectOneById(int carId);
	
	//通过车id跟车品牌来更新车数量
	public int updateAmountByIdAndBrand(Cars car);
	
	//查询所有汽车
    public List<Cars> selectAllCars();
    
  //增加车辆
    public int addCar(Cars car);
    
  //通过carId来更新车辆信息
    public int updateCarById(Cars car);
    
  //根据汽车carId和汽车carBrand删除车辆
    public int deleteCarByIdAndBrand(int carId,String carBrand);
}
