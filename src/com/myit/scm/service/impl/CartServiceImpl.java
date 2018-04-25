package com.myit.scm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myit.scm.dao.CartDao;
import com.myit.scm.entity.Cart;
import com.myit.scm.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;

	@Override
	public int insertOneCart(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.insertOneCart(cart);
	}

	@Override
	public int selectAllThings(int cartUserId) {
		// TODO Auto-generated method stub
		return cartDao.selectAllThings(cartUserId);
	}

	@Override
	public Cart selectThingsByUserId(int cartUserId) {
		// TODO Auto-generated method stub
		return cartDao.selectThingsByUserId(cartUserId);
	}

	@Override
	public int updateCartByUserId(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.updateCartByUserId(cart);
	}

	@Override
	public Cart selectByUserIdAndCarBrand(int cartUserId, String carBrand) {
		// TODO Auto-generated method stub
		return cartDao.selectByUserIdAndCarBrand(cartUserId, carBrand);
	}

	@Override
	public List<Cart> selectCartAll() {
		// TODO Auto-generated method stub
		return cartDao.selectCartAll();
	}

}
