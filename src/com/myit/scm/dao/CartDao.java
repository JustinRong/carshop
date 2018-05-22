package com.myit.scm.dao;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cart;

public interface CartDao {

	//添加记录到购物车cart中
	public int insertOneCart(Cart cart);
	
	//查询当前用户购物车的所有记录的总和
	public int selectAllThings(int cartUserId);
	
	//通过userID来查询购物车是否有记录
	public List<Cart> selectThingsByUserId(int cartUserId);
	
	//通过userid跟carBrand来查询购物车中是否有记录
	public Cart selectByUserIdAndCarBrand(int cartUserId,String carBrand);
	
	//更新数据库中购物车的商品信息
	public int updateCartByUserId(Cart cart);
	
	//查询购物车中所有的商品信息
	public List<Cart> selectCartAll();
	
	//根据cart_id来查找购物车信息
	public Cart selectOneByCartId(int cartId);
	
	//购买成功后将结算状态改为1
	public int updateCartIsPay(int cartId);
	
	//根据cartUserID来查询购物车中已购车辆信息
	public List<Cart> selectByCartUserId(int cartUserId);
	
	//根据Cart中的cartid和carid来删除数据
  	public int deleteByCartIdAndCarId(Cart cart);
  	
  	//查询已经下单还没出库的订单信息
  	public List<Cart> selectAllOrder();
  	
  	//更新订单出库
  	public int updateCartOrder(int cartId);
}
