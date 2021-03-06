package com.myit.scm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myit.scm.dao.CarsDao;
import com.myit.scm.entity.Cars;
import com.myit.scm.service.CarsService;

@Service("carsService")
public class CarsServiceImpl implements CarsService {

	@Autowired
	private CarsDao carsDao;
	
	@Override
	public List<Cars> selectAllOrOne(String carBrand) {
		// TODO Auto-generated method stub
		return carsDao.selectAllOrOne(carBrand);
	}

	@Override
	public Cars selectOneById(int carId) {
		// TODO Auto-generated method stub
		return carsDao.selectOneById(carId);
	}

	@Override
	public int updateAmountByIdAndBrand(Cars car) {
		// TODO Auto-generated method stub
		return carsDao.updateAmountByIdAndBrand(car);
	}

  @Override
  public List<Cars> selectAllCars() {
    // TODO Auto-generated method stub
    return carsDao.selectAllCars();
  }

  @Override
  public int addCar(Cars car) {
    // TODO Auto-generated method stub
    return carsDao.addCar(car);
  }

  @Override
  public int updateCarById(Cars car) {
    // TODO Auto-generated method stub
    return carsDao.updateCarById(car);
  }

  @Override
  public int deleteCarByIdAndBrand(int carId, String carBrand) {
    // TODO Auto-generated method stub
    return carsDao.deleteCarByIdAndBrand(carId, carBrand);
  }

}
