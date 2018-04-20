package com.myit.scm.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

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
	
	@RequestMapping(value="/searchCars")
	@ResponseBody
	public String selectCars(ModelMap model,String carBrand){
		List<Cars> carsList = carsService.selectAllOrOne("%"+carBrand+"%");
		if (carsList != null) {
			model.addAttribute("Cars", carsList);
			for (int i=0;i<carsList.size();i++){
				Cars cars = carsList.get(i);
				System.out.println(cars.toString());
			}
		}
		return "{\"key\":\"0\"}";
	}
}
