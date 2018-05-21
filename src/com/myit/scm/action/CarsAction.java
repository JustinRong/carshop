package com.myit.scm.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myit.scm.entity.Cars;
import com.myit.scm.service.CarsService;

@Controller
@RequestMapping(value="/cars")
@SessionAttributes(value="Cars")
public class CarsAction {

	@Resource
	private CarsService carsService;
	
	/**
	 * 通过条形栏输入车型进行模糊查询
	 * @param model
	 * @param carBrand
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/searchCars")
	@ResponseBody
	public String selectCars(ModelMap model,String carBrand,HttpSession session){
		List<Cars> carsList = carsService.selectAllOrOne("%"+carBrand+"%");
		if (carsList != null) {
			session.setAttribute("carBrand", carBrand);
			model.addAttribute("Cars", carsList);
			for (int i=0;i<carsList.size();i++){
				Cars cars = carsList.get(i);
				System.out.println(cars.toString());
			}
		}
		return "{\"key\":\"0\"}";
	}
	
	@RequestMapping(value="/searchOneCar")
	@ResponseBody
	public String selectOneCar(int carId,HttpSession session){
		if(carId >0){
			Cars car = carsService.selectOneById(carId);
			if (car !=null){
				session.setAttribute("carForEdit", car);
				return "{\"key\":\"1\"}";
			}
		}
		return "{\"key\":\"0\"}";
	}
	
	@RequestMapping(value="/selectAllCars")
	@ResponseBody
	public String selectAllCars(HttpSession session) {
	  List<Cars> cars = carsService.selectAllCars();
	  System.out.println(cars.toString());
	  if (cars!=null) {
	    session.setAttribute("allCars", cars);
	      return "{\"key\":\"1\"}";
      }
	 return "{\"key\":\"0\"}";
	}
	
	@RequestMapping(value="/addCar")
	@ResponseBody
	public String addCar(String carBrand,double carPrice,int carAmount,String carInstruction,Date carDate) {
	  Cars cars = new Cars();
	  cars.setCarBrand(carBrand);
	  cars.setCarAmount(carAmount);
	  cars.setCarInstruction(carInstruction);
	  cars.setCarPrice(carPrice);
	  cars.setCarDate(carDate);
	  int addCar = carsService.addCar(cars);
	  if(addCar>0) {
	    return "{\"key\":\"1\"}";
	  }
	  return "{\"key\":\"0\"}";
	}
	
	@RequestMapping(value="/updateCar")
	@ResponseBody
	public String updateCar(int carId,String carBrand,double carPrice,int carAmount,String carInstruction,Date carDate) {
	  Cars cars = new Cars();
	  cars.setCarId(carId);
	  cars.setCarAmount(carAmount);
	  cars.setCarBrand(carBrand);
	  cars.setCarDate(carDate);
	  cars.setCarInstruction(carInstruction);
	  cars.setCarPrice(carPrice);
	  cars.setCarUrl(null);
	  int update = carsService.updateCarById(cars);
	  if (update>0) {
        return "{\"key\":\"1\"}";
      }
	  return "{\"key\":\"0\"}";
	}
	
	@RequestMapping(value="/deleteCar")
	@ResponseBody
	public String deleteCar(int carId,String carBrand) {
	  int delete = carsService.deleteCarByIdAndBrand(carId, carBrand);
	  if (delete>0) {
	    return "{\"key\":\"1\"}";
      }
	  return "{\"key\":\"0\"}";
	}
}
