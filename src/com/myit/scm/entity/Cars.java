package com.myit.scm.entity;

import java.util.Date;

public class Cars {
	
	private int carId;//��������
	private double carPrice;//�����۸�
	private String carInstruction;//��������
	private int carAmount;//��������
	private String carBrand;//����Ʒ��
	private String carUrl;//����ͼƬURL
	private Date carDate;//�������ʱ��
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public double getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(double carPrice) {
		this.carPrice = carPrice;
	}
	public String getCarInstruction() {
		return carInstruction;
	}
	public void setCarInstruction(String carInstruction) {
		this.carInstruction = carInstruction;
	}
	
	public int getCarAmount() {
		return carAmount;
	}
	public void setCarAmount(int carAmount) {
		this.carAmount = carAmount;
	}
	public String getCarBrand() {
		return carBrand;
	}
	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}
	public String getCarUrl() {
		return carUrl;
	}
	public void setCarUrl(String carUrl) {
		this.carUrl = carUrl;
	}
	
	public Date getCarDate() {
    return carDate;
  }
  public void setCarDate(Date carDate) {
    this.carDate = carDate;
  }
  @Override
  public String toString() {
    return "{\"carId\":\"" + carId + "\",\"carPrice\":\"" + carPrice + "\",\"carInstruction\":\""
        + carInstruction + "\",\"carAmount\":\"" + carAmount + "\",\"carBrand\":\"" + carBrand
        + "\",\"carUrl\":\"" + carUrl + "\",\"carDate\":\"" + carDate + "\"} ";
  }

  
	
}
