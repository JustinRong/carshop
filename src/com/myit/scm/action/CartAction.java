package com.myit.scm.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myit.scm.entity.Cars;
import com.myit.scm.entity.Cart;
import com.myit.scm.service.CarsService;
import com.myit.scm.service.CartService;
import com.myit.scm.service.UserService;

@Controller
@RequestMapping(value="/cart")
@SessionAttributes(value="Cart")
public class CartAction {
	@Autowired
	private CarsService carsService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;

	@RequestMapping(value="/addCart")
	@ResponseBody
	public String addCart(ModelMap model, int carId, int amount, String userName){
		Cart cart = new Cart();
		if (carId != 0 && carId > 0){
			//ͨ��ҳ�洫������carid����ѯ���ݿ���car���Ƿ���������
			Cars car = carsService.selectOneById(carId);
			if (car != null){
				int insertOneCart =0;
				insertOneCart = judeInsertOrUpdate(userName, cart, insertOneCart,car, amount);
				if(insertOneCart>0){
					int allThings = cartService.selectAllThings(cart.getCartUserId());
					if(allThings>0){
						System.out.println("**********************"+allThings);
						model.addAttribute("Cart", allThings);
					}
				}
			}
		}
		return "{\"key\":\"0\"}";
	}

	/**
	 * �жϹ��ﳵ�Ƿ��м�¼���еĻ��͸�����Ʒ��Ϣ��û�еĻ��������Ʒ��Ϣ
	 * @param userName
	 * @param cart
	 * @param insertOneCart
	 * @return
	 */
	public int judeInsertOrUpdate(String userName, Cart cart, int insertOneCart,Cars car,int amount) {
		//����username��ѯ��ǰ�û���userid
		int userId = userService.selectIdByName(userName);
		if(userId>0){
			cart.setCartUserId(userId);
			//����userid ����ѯ���ݿ���cart�����Ƿ�����Ʒ��Ϣ��¼
			Cart cart2 = cartService.selectByUserIdAndCarBrand(userId, car.getCarBrand());
			if(cart2 == null){
				cart.setCartAmount(1);
				cart.setCartThings(car.getCarBrand());
				cart.setCartPrice(car.getCarPrice());
				insertOneCart = cartService.insertOneCart(cart);
			}else{
				if(cart2.getCartThings().equals(car.getCarBrand())){
					Cart cartPriceAndAmount = cartPriceAndAmount(amount, car,cart2);
					cartPriceAndAmount.setCartUserId(userId);
					insertOneCart= cartService.updateCartByUserId(cartPriceAndAmount);
				}else{
					cart.setCartAmount(1);
					cart.setCartThings(car.getCarBrand());
					cart.setCartPrice(car.getCarPrice());
					insertOneCart= cartService.insertOneCart(cart);
				}
			}
		}
		return insertOneCart;
	}

	/**
	 * ���ﳵ��Ʒ�۸�����������㷨
	 * @param amount
	 * @param car
	 * @return
	 */
	public Cart cartPriceAndAmount(int amount, Cars car,Cart cart2) {
		Cart cart;
		cart = new Cart();
		amount = amount+cart2.getCartAmount();
		double price = car.getCarPrice() * amount;
		cart.setCartThings(car.getCarBrand());
		cart.setCartAmount(amount);
		cart.setCartPrice(price);
		
		return cart;
	}
	
}
