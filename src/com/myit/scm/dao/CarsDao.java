package com.myit.scm.dao;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cars;

public interface CarsDao {

	//��ѯȫ������һ������
	public List<Cars> selectAllOrOne(String carBrand);
	
	//ͨ����id��ѯ
	public Cars selectOneById(int carId);
}
