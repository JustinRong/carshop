package com.myit.scm.dao;

import com.myit.scm.entity.Cart;

public interface CartDao {

	//添加记录到购物车cart中
	public int insertOneCart(Cart cart);
	
	//查询当前用户购物车的所有记录的总和
	public int selectAllThings(int cartUserId);
	
	//通过userID来查询购物车是否有记录
	public Cart selectThingsByUserId(int cartUserId);
	
	//通过userid跟carBrand来查询购物车中是否有记录
	public Cart selectByUserIdAndCarBrand(int cartUserId,String carBrand);
	
	//更新数据库中购物车的商品信息
	public int updateCartByUserId(Cart cart);
}
