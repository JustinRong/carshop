package com.myit.scm.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import com.fasterxml.jackson.annotation.ObjectIdGenerators.StringIdGenerator;
import com.myit.scm.entity.Cars;
import com.myit.scm.entity.Check;
import com.myit.scm.service.CheckService;

@Controller
@RequestMapping(value="/check")
public class CheckAction {

  @Autowired
  private CheckService checkService;
  
  @RequestMapping(value="/checkAdd")
  @ResponseBody
  public String checkAdd(Integer checkCarId, String checkCarBrand,
                         String checkPerson,Integer checkLink,
                         String checkIns,Date checkDate) {
    Check check = new Check();
    check.setCheckCarBrand(checkCarBrand);
    check.setCheckCarId(checkCarId);
    check.setCheckCarPerson(checkPerson);
    check.setCheckDate(checkDate);
    check.setCheckInstruction(checkIns);
    check.setCheckLink(checkLink);
    
    int insertOne = checkService.insertOne(check);
    if(insertOne>0) {
      return "{\"key\":\"1\"}";
    }
    return "{\"key\":\"0\"}";
  }
  
  @RequestMapping(value="/uploadFiles")
  @ResponseBody
  public String uploadFiles(HttpServletRequest request,HttpServletResponse response) {
  //获取服务器中保存文件的路径
    String path = request.getSession().getServletContext().getRealPath("")+"upload/record/";
    System.out.println(path);
     //获取解析器  
       CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
       //判断是否是文件  
       if(resolver.isMultipart(request)){  
           //进行转换  
           MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)(request);  
           //获取所有文件名称  
           Iterator<String> it = multiRequest.getFileNames();  
           boolean c = it.hasNext();
           //TODO c为false 找不到文件名称，是前端穿不了值进来，还是后台读不了数据
           while(it.hasNext()){  
               //根据文件名称取文件  
               MultipartFile file = multiRequest.getFile(it.next());  
               String fileName = file.getOriginalFilename();  
               String localPath = path + fileName;  
               //创建一个新的文件对象，创建时需要一个参数，参数是文件所需要保存的位置
               File newFile = new File(localPath);  
               //上传的文件写入到指定的文件中  
               try {
                file.transferTo(newFile);
              } catch (IllegalStateException e) {
                // 
                e.printStackTrace();
              } catch (IOException e) {
                // 
                e.printStackTrace();
              }  
           }  
       }
    return "{\"key\":\"1\"}";
  }
  
  @RequestMapping(value="/selectAllCheck")
  @ResponseBody
  public String selectAllCars(HttpSession session) {
    List<Check> checks = checkService.selectAll();
    if (checks!=null) {
      session.setAttribute("allChecks", checks);
        return "{\"key\":\"1\"}";
    }
   return "{\"key\":\"0\"}";
  }
  
  @RequestMapping(value="/updateCheck")
  @ResponseBody
  public String updateCheck(int checkId) {
    if (checkId>0) {
      int id = checkService.updateCheckById(checkId);
      if (id>0) {
          return "{\"key\":\"1\"}";
      }
    }
   return "{\"key\":\"0\"}";
  }
}
