package com.myit.scm.entity;

public class Order {
  private int cartId;//����id
  private String carBrand;//��������
  private double carPrice;//�ܼ�
  private int carAmount;//��������
  private int carId;//�������
  private int isPay;//�Ƿ��µ�
  private int isOrder;//�Ƿ����
  private String username;//�ͻ�����
  private String phone;//�ͻ��ֻ�����
  private String address;//�ͻ���ַ
  private String cardId;//�ͻ����֤����
  public String getCarBrand() {
    return carBrand;
  }
  public void setCarBrand(String carBrand) {
    this.carBrand = carBrand;
  }
  public double getCarPrice() {
    return carPrice;
  }
  public void setCarPrice(double carPrice) {
    this.carPrice = carPrice;
  }
  public int getCarAmount() {
    return carAmount;
  }
  public void setCarAmount(int carAmount) {
    this.carAmount = carAmount;
  }
  public int getCarId() {
    return carId;
  }
  public void setCarId(int carId) {
    this.carId = carId;
  }
  
  public int getIsPay() {
    return isPay;
  }
  public void setIsPay(int isPay) {
    this.isPay = isPay;
  }
  public int getIsOrder() {
    return isOrder;
  }
  public void setIsOrder(int isOrder) {
    this.isOrder = isOrder;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
  public String getCardId() {
    return cardId;
  }
  public void setCardId(String cardId) {
    this.cardId = cardId;
  }
  public int getCartId() {
    return cartId;
  }
  public void setCartId(int cartId) {
    this.cartId = cartId;
  }
  
}
