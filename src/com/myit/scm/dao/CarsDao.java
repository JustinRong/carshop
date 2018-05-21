package com.myit.scm.dao;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cars;

public interface CarsDao {

	//��ѯȫ������һ������
	public List<Cars> selectAllOrOne(String carBrand);
	
	//ͨ����id��ѯ
	public Cars selectOneById(int carId);
	
	//ͨ����id����Ʒ�������³�����
	public int updateAmountByIdAndBrand(Cars car);
	
	//��ѯ��������
	public List<Cars> selectAllCars();
	
	//���ӳ���
	public int addCar(Cars car);
	
	//ͨ��carId�����³�����Ϣ
	public int updateCarById(Cars car);
	
	//��������carId������carBrandɾ������
	public int deleteCarByIdAndBrand(int carId,String carBrand);
}
