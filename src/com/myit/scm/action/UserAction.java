package com.myit.scm.action;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.myit.scm.entity.User;
import com.myit.scm.service.CartService;
import com.myit.scm.service.UserService;
import com.myit.scm.util.MemoryDataUtil;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes(value="User")
public class UserAction {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	@Resource
	private CartService cartService;

	@ResponseBody
	@RequestMapping(value="/login")
	public User login(String username,  String password, ModelMap model,HttpSession session) {
		User user = userService.selectOne(username,password);
		if (user == null ){
			return null;
		}
		model.addAttribute("User", user);
		int allThings = cartService.selectAllThings(user.getuserId());
		if(allThings>0){
			System.out.println("**********************"+allThings);
			/*model.addAttribute("Cart", allThings);*/
			session.setAttribute("cartCount", allThings);
		}
		/*//存放用户的sessionID
		String sessionID = request.getRequestedSessionId();
		String uname = user.getuserName();
		System.out.println(sessionID);
		if(!MemoryDataUtil.getSessionIDMap().containsKey(uname)){
			MemoryDataUtil.getSessionIDMap().put(uname, sessionID);
			return user;
		}else if (MemoryDataUtil.getSessionIDMap().containsKey(uname)){
			MemoryDataUtil.getSessionIDMap().remove(uname);
			MemoryDataUtil.getSessionIDMap().put(uname, sessionID);
			return null;
		}
		
		return null;
		*/
		return user;
	}
	
	@ResponseBody
	@RequestMapping(value = "/register")
	public String addUser (String username, String password){
		User user = userService.selectByUserName(username);
		if(user!=null && user.getPermission() == true){
			return "{\"key\":\"isRegisted\"}";
		}else{
			User u =new User(username, password);
			int addOne = userService.addOne(u);
			if (addOne !=0){
				return "{\"key\":\"yes\"}";
			}
		}
		return "{\"key\":\"no\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/update")
	public String updateUser(String userName,String realName,String email,String phone,String IdNum,String address) {
		if(userName !=null && userName != "" && realName!=null && realName!="" && phone!=null && phone != "" && IdNum != null && IdNum !="" && address !=null && address != ""){
			User user  = new User();
			user.setuserName(userName);
			user.setRealName(realName);
			if (email != null && email != "") {
				System.out.println("____________________"+email);
				user.setEmail(email);
			}
			user.setPhone(phone);
			user.setIdNum(IdNum);
			user.setAddress(address);
			System.out.println("*****************"+user.getEmail());
			int updateOne = userService.updateOne(user);
			if(updateOne != 0 ){
				return "{\"key\":\"1\"}";
			}
		}
		return "{\"key\":\"0\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginOut")
	public String loginOut(ModelMap model,HttpServletResponse response){
		User user =new User();
		model.addAttribute("User", user);
		return "{\"key\":\"0\"}";
	}
	
	/*@RequestMapping(value="/selectInfo")
	public String selectUserInfo(String userName){
		if (userName!=null&&userName!=""){
			User user = userService.selectByUserName(userName);
			if (user!=null){
				
			}
		}
		return "";
	}*/
}
