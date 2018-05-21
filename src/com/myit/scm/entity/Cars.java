package com.myit.scm.entity;

import java.util.Date;

public class Cars {
	
	private int carId;//汽车主键
	private double carPrice;//汽车价格
	private String carInstruction;//汽车介绍
	private int carAmount;//汽车数量
	private String carBrand;//汽车品牌
	private String carUrl;//汽车图片URL
	private Date carDate;//汽车入库时间
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
