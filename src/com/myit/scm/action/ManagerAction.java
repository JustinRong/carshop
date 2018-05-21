package com.myit.scm.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.myit.scm.entity.Manager;
import com.myit.scm.service.ManagerService;

@Controller
@RequestMapping(value="/manager")
public class ManagerAction {

  @Autowired
  private ManagerService managerService;
  
  @RequestMapping(value="/login")
  public String login(String username,String password,HttpSession session,HttpServletResponse response) {
    Manager manager = managerService.selectOne(username, password);
    if (manager!=null) {
      if (manager.getPermission()>0) {
        session.setAttribute("userType", 0);
        session.setAttribute("adminuserName", manager.getUsername());
        session.setAttribute("adminPw", manager.getPassword());
        session.setAttribute("manaId", manager.getManagerId());
        return "redirect:../admin/index.jsp";
      }else {
        return "redirect:../adminLogin.jsp";
      }
    }else {
      return "redirect:../adminLogin.jsp";
    }
  }
  
  @RequestMapping(value="/updatePwd")
  @ResponseBody
  public String updateMana(String newPwd,int manaId) {
    if (newPwd!=null && manaId>0) {
      int update = managerService.updatePwdById(newPwd, manaId);
      if (update>0) {
        return "{\"key\":\"1\"}";
      }
      return "{\"key\":\"0\"}";
    }
    return "{\"key\":\"0\"}";
  }
}
