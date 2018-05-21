package com.myit.scm.service;

import java.util.List;

import com.myit.scm.entity.Cars;

public interface CarsService {

	//��ѯȫ����һ������
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
