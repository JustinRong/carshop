package com.myit.scm.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	public String addCart(ModelMap model, int carId, int amount, String userName,HttpSession session){
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
						/*model.addAttribute("Cart", allThings);*/
						session.setAttribute("cartCount", allThings);
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
				insertOneCart = cartNoThings(cart, car);
			}else{
				insertOneCart = cartHasThings(cart, car, amount, userId, cart2);
			}
			//������ҳ����Ʒչʾ������
			if(insertOneCart>0){
				int updateAmount = car.getCarAmount() - amount;
				car.setCarAmount(updateAmount);
				int carAmount = carsService.updateAmountByIdAndBrand(car);
				if (carAmount > 0){
					return insertOneCart;
				}
			}
		}
		return 0;
	}

	/**
	 * ������ﳵ������ؼ�¼���ж��Ƿ������id����Ʒ��Ϣ��û�о���ӣ��о͸�������
	 * @param cart
	 * @param car
	 * @param amount
	 * @param userId
	 * @param cart2
	 * @return
	 */
	public int cartHasThings(Cart cart, Cars car, int amount, int userId, Cart cart2) {
		int insertOneCart;
		if(cart2.getCartThings().equals(car.getCarBrand())){
			Cart cartPriceAndAmount = cartPriceAndAmount(amount, car,cart2);
			cartPriceAndAmount.setCartUserId(userId);
			cartPriceAndAmount.setCarId(car.getCarId());
			insertOneCart= cartService.updateCartByUserId(cartPriceAndAmount);
		}else{
			insertOneCart = cartNoThings(cart, car);
		}
		return insertOneCart;
	}

	/**
	 * ������ﳵ��û�м�¼�������һ����¼
	 * @param cart
	 * @param car
	 * @return
	 */
	public int cartNoThings(Cart cart, Cars car) {
		int insertOneCart;
		cart.setCartAmount(1);
		cart.setCartThings(car.getCarBrand());
		cart.setCartPrice(car.getCarPrice());
		cart.setCarId(car.getCarId());
		insertOneCart = cartService.insertOneCart(cart);
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
	
	@RequestMapping(value="/selectCartAll")
	@ResponseBody
	public String selectAll(ModelMap model){
		List<Cart> cartList = cartService.selectCartAll();
		if(cartList.size()>0){
			model.addAttribute("Cart", cartList);
		}
		return "{\"key\":\"0\"}";
	}
	
	/**
	 * ͨ��cartid����ѯ���ﳵ��¼��Ȼ���ȡ���ﳵ���������бȽϣ�����ǵĻ���ֱ�Ӹ���ispay��
	 * ���������һ�µĻ��������������۸�Ȼ�����ispay
	 * Ȼ���ٸ���car��������
	 * @param cartId
	 * @param cartAmount
	 * @return
	 */
	@RequestMapping(value="/buyCar")
	public String buyCar(int cartId,int cartAmount,int carId){
		if(cartId>0 && cartAmount>0 && carId>0){
			//TODO ���������
		  Cart cart = cartService.selectOneByCartId(cartId);
		  if(cart !=null) {
		    //�ж������Ƿ����
		    if(cart.getCartAmount()==cartAmount) {
		      //���¹��ﳵ״̬������Ʒ����Ϊ�ѹ���is_pay=1��
		      cartService.updateCartIsPay(cartId);
		    }else {
		      int amount = cart.getCartAmount();
		      double price = cart.getCartPrice();
		      double single = price/amount;
		      cart.setCartAmount(cartAmount);
		      cart.setCartPrice(single*cartAmount);
		      //���¹��ﳵ��Ϣ
		      int update = cartService.updateCartByUserId(cart);
		      if(update>0) {
		        //���¹���״̬
		        int update1 = cartService.updateCartIsPay(cartId);
		        if(update1>0) {
		          //����carid��ѯcars���еĳ���
		          Cars car = carsService.selectOneById(carId);
		          if(cartAmount>amount) {//������������������ڲ�ѯ�������������Cars���и�����������
		            int num = cartAmount-amount;
		            car.setCarAmount(car.getCarAmount()-num);
		          }
		          if(cartAmount<amount) {//���������������С�ڲ�ѯ��������������Cars���и�����������
		            int num = amount-cartAmount;
		            car.setCarAmount(car.getCarAmount()+num);
		          }
		          carsService.updateAmountByIdAndBrand(car);
		          return "{\"key\":\"1\"}";
		        }
		      }
		    }
		  }
		}
		return "{\"key\":\"0\"}";
	}
}
