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
			//通过页面传进来的carid来查询数据库中car表是否有这辆车
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
	 * 判断购物车是否有记录，有的话就更新商品信息，没有的话就添加商品信息
	 * @param userName
	 * @param cart
	 * @param insertOneCart
	 * @return
	 */
	public int judeInsertOrUpdate(String userName, Cart cart, int insertOneCart,Cars car,int amount) {
		//根据username查询当前用户的userid
		int userId = userService.selectIdByName(userName);
		if(userId>0){
			cart.setCartUserId(userId);
			//根据userid 来查询数据库中cart表中是否有商品信息记录
			Cart cart2 = cartService.selectByUserIdAndCarBrand(userId, car.getCarBrand());
			if(cart2 == null){
				insertOneCart = cartNoThings(cart, car);
			}else{
				insertOneCart = cartHasThings(cart, car, amount, userId, cart2);
			}
			//更新网页上商品展示的数量
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
	 * 如果购物车中有相关记录，判断是否有这个id的商品信息，没有就添加，有就更新数量
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
	 * 如果购物车中没有记录就添加这一条记录
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
	 * 购物车商品价格跟数量计算算法
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
	 * 通过cartid来查询购物车记录，然后获取购物车中数量进行比较，如果是的话，直接更新ispay，
	 * 如果数量不一致的话，更新数量跟价格，然后更新ispay
	 * 然后再更新car表中数量
	 * @param cartId
	 * @param cartAmount
	 * @return
	 */
	@RequestMapping(value="/buyCar")
	public String buyCar(int cartId,int cartAmount,int carId){
		if(cartId>0 && cartAmount>0 && carId>0){
			//TODO 上面的内容
		  Cart cart = cartService.selectOneByCartId(cartId);
		  if(cart !=null) {
		    //判断数量是否相等
		    if(cart.getCartAmount()==cartAmount) {
		      //更新购物车状态，将商品设置为已购（is_pay=1）
		      cartService.updateCartIsPay(cartId);
		    }else {
		      int amount = cart.getCartAmount();
		      double price = cart.getCartPrice();
		      double single = price/amount;
		      cart.setCartAmount(cartAmount);
		      cart.setCartPrice(single*cartAmount);
		      //更新购物车信息
		      int update = cartService.updateCartByUserId(cart);
		      if(update>0) {
		        //更新购物状态
		        int update1 = cartService.updateCartIsPay(cartId);
		        if(update1>0) {
		          //根据carid查询cars表中的车辆
		          Cars car = carsService.selectOneById(carId);
		          if(cartAmount>amount) {//如果传入来的数量大于查询的数量，则减少Cars表中该汽车的数量
		            int num = cartAmount-amount;
		            car.setCarAmount(car.getCarAmount()-num);
		          }
		          if(cartAmount<amount) {//如果传入来的数量小于查询的数量，则增加Cars表中该汽车的数量
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
