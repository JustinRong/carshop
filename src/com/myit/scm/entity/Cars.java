package com.myit.scm.entity;

public class Cars {
	
	private int carId;//��������
	private double carPrice;//�����۸�
	private String carInstruction;//��������
	private int carAmount;//��������
	private String carBrand;//����Ʒ��
	private String carUrl;//����ͼƬURL
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
	@Override
	public String toString() {
		return "Cars [carId=" + carId + ", carPrice=" + carPrice + ", carInstruction=" + carInstruction + ", carAmount="
				+ carAmount + ", carBrand=" + carBrand + ", carUrl=" + carUrl + "]";
	}
	
	
}
