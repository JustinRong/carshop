package com.myit.scm.entity;

public class Cart {

	private int cartId; //���ﳵId
	private String cartThings;//��Ʒ
	private double cartPrice;//�۸�
	private int cartAmount;//����
	private int cartUserId;//�û�Id
	private Cars cars;//����
	
	public Cars getCars() {
		return cars;
	}
	public void setCars(Cars cars) {
		this.cars = cars;
	}
	public int getCartUserId() {
		return cartUserId;
	}
	public void setCartUserId(int cartUserId) {
		this.cartUserId = cartUserId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getCartThings() {
		return cartThings;
	}
	public void setCartThings(String cartThings) {
		this.cartThings = cartThings;
	}
	public double getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(double cartPrice) {
		this.cartPrice = cartPrice;
	}
	public int getCartAmount() {
		return cartAmount;
	}
	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", cartThings=" + cartThings + ", cartPrice=" + cartPrice + ", cartAmount="
				+ cartAmount + ", cartUserId=" + cartUserId + ", cars=" + cars + "]";
	}
	
	
	
	
	
}
