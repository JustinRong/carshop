package com.myit.scm.entity;

public class Order {
  private int cartId;//订单id
  private String carBrand;//汽车名称
  private double carPrice;//总价
  private int carAmount;//汽车数量
  private int carId;//汽车编号
  private int isPay;//是否下单
  private int isOrder;//是否出库
  private String username;//客户姓名
  private String phone;//客户手机号码
  private String address;//客户地址
  private String cardId;//客户身份证号码
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
