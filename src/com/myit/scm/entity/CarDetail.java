package com.myit.scm.entity;

import java.util.Date;

public class CarDetail {

	private int carDetailId;//�����id
	private int carId;//�������
	private String carVendor;//����
	private String carLevel;//����
	private String carEnergyType;//��Դ����
	private Date carTimeToMarket;//����ʱ��
	private int carMaxPower;//�����
	private int carMaxTorque;//���Ť��
	private String carEngine;//������
	private String carTransmission;//������
	private String carBody;//����
	private String carBodyStructure;//����ṹ
	private double carHighestSpeed;//���ʱ��
	private double carAccelerationSeconds;//0-100km/h��������(s)
	private String carVehicleWarranty;//�����ʱ�
	private String carImage1;
	private String carImage2;
	private String carImage3;
	public int getCarDetailId() {
		return carDetailId;
	}
	public void setCarDetailId(int carDetailId) {
		this.carDetailId = carDetailId;
	}
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public String getCarVendor() {
		return carVendor;
	}
	public void setCarVendor(String carVendor) {
		this.carVendor = carVendor;
	}
	public String getCarLevel() {
		return carLevel;
	}
	public void setCarLevel(String carLevel) {
		this.carLevel = carLevel;
	}
	public String getCarEnergyType() {
		return carEnergyType;
	}
	public void setCarEnergyType(String carEnergyType) {
		this.carEnergyType = carEnergyType;
	}
	public Date getCarTimeToMarket() {
		return carTimeToMarket;
	}
	public void setCarTimeToMarket(Date carTimeToMarket) {
		this.carTimeToMarket = carTimeToMarket;
	}
	public int getCarMaxPower() {
		return carMaxPower;
	}
	public void setCarMaxPower(int carMaxPower) {
		this.carMaxPower = carMaxPower;
	}
	public int getCarMaxTorque() {
		return carMaxTorque;
	}
	public void setCarMaxTorque(int carMaxTorque) {
		this.carMaxTorque = carMaxTorque;
	}
	public String getCarEngine() {
		return carEngine;
	}
	public void setCarEngine(String carEngine) {
		this.carEngine = carEngine;
	}
	public String getCarTransmission() {
		return carTransmission;
	}
	public void setCarTransmission(String carTransmission) {
		this.carTransmission = carTransmission;
	}
	public String getCarBody() {
		return carBody;
	}
	public void setCarBody(String carBody) {
		this.carBody = carBody;
	}
	public String getCarBodyStructure() {
		return carBodyStructure;
	}
	public void setCarBodyStructure(String carBodyStructure) {
		this.carBodyStructure = carBodyStructure;
	}
	public double getCarHighestSpeed() {
		return carHighestSpeed;
	}
	public void setCarHighestSpeed(double carHighestSpeed) {
		this.carHighestSpeed = carHighestSpeed;
	}
	public double getCarAccelerationSeconds() {
		return carAccelerationSeconds;
	}
	public void setCarAccelerationSeconds(double carAccelerationSeconds) {
		this.carAccelerationSeconds = carAccelerationSeconds;
	}
	public String getCarVehicleWarranty() {
		return carVehicleWarranty;
	}
	public void setCarVehicleWarranty(String carVehicleWarranty) {
		this.carVehicleWarranty = carVehicleWarranty;
	}
	public String getCarImage1() {
		return carImage1;
	}
	public void setCarImage1(String carImage1) {
		this.carImage1 = carImage1;
	}
	public String getCarImage2() {
		return carImage2;
	}
	public void setCarImage2(String carImage2) {
		this.carImage2 = carImage2;
	}
	public String getCarImage3() {
		return carImage3;
	}
	public void setCarImage3(String carImage3) {
		this.carImage3 = carImage3;
	}
	@Override
	public String toString() {
		return "CarDetail [carDetailId=" + carDetailId + ", carId=" + carId + ", carVendor=" + carVendor + ", carLevel="
				+ carLevel + ", carEnergyType=" + carEnergyType + ", carTimeToMarket=" + carTimeToMarket
				+ ", carMaxPower=" + carMaxPower + ", carMaxTorque=" + carMaxTorque + ", carEngine=" + carEngine
				+ ", carTransmission=" + carTransmission + ", carBody=" + carBody + ", carBodyStructure="
				+ carBodyStructure + ", carHighestSpeed=" + carHighestSpeed + ", carAccelerationSeconds="
				+ carAccelerationSeconds + ", carVehicleWarranty=" + carVehicleWarranty + ", carImage1=" + carImage1
				+ ", carImage2=" + carImage2 + ", carImage3=" + carImage3 + "]";
	}
	
	
	
	
}
