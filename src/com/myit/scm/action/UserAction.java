package com.myit.scm.action;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


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
import com.myit.scm.service.UserService;
import com.myit.scm.util.MemoryDataUtil;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes(value="User")
public class UserAction {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;

	@ResponseBody
	@RequestMapping(value="/login")
	public User login(String username,  String password, ModelMap model,HttpServletRequest request) {
		User user = userService.selectOne(username,password);
		if (user == null ){
			return null;
		}
		model.addAttribute("User", user);
		
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
		User user = login(username, password, null,null);
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
}
