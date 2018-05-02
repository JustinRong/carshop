package com.myit.scm.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myit.scm.entity.CarDetail;
import com.myit.scm.entity.Cars;
import com.myit.scm.service.CarDetailService;
import com.myit.scm.service.CarsService;

@Controller
@RequestMapping(value="/carDetail")
public class CarDetailAction {

	@Autowired
	private CarDetailService carDetailService;
	@Autowired
	private CarsService carsService;
	
	@RequestMapping(value="/searchOneCar")
	@ResponseBody
	public String selectOneCar(int carId,HttpSession session){
		if(carId >0){
			Cars car = carsService.selectOneById(carId);
			if (car !=null){
				CarDetail carDetail = carDetailService.selectByCarId(car.getCarId());
				session.setAttribute("carDetail", car);
				session.setAttribute("carDetails", carDetail);
				return "{\"url\":\"carDetail.jsp\"}";
			}
		}
		return "{\"url\":\"1\"}";
	}
}
