package com.myit.scm.service;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cars;

public interface CarsService {

	//��ѯȫ����һ������
	public List<Cars> selectAllOrOne(String carBrand);
	
	//ͨ����id��ѯ
	public Cars selectOneById(int carId);
}
