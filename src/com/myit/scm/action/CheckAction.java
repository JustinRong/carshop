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
  //��ȡ�������б����ļ���·��
    String path = request.getSession().getServletContext().getRealPath("")+"upload/record/";
    System.out.println(path);
     //��ȡ������  
       CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
       //�ж��Ƿ����ļ�  
       if(resolver.isMultipart(request)){  
           //����ת��  
           MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)(request);  
           //��ȡ�����ļ�����  
           Iterator<String> it = multiRequest.getFileNames();  
           boolean c = it.hasNext();
           //TODO cΪfalse �Ҳ����ļ����ƣ���ǰ�˴�����ֵ���������Ǻ�̨����������
           while(it.hasNext()){  
               //�����ļ�����ȡ�ļ�  
               MultipartFile file = multiRequest.getFile(it.next());  
               String fileName = file.getOriginalFilename();  
               String localPath = path + fileName;  
               //����һ���µ��ļ����󣬴���ʱ��Ҫһ���������������ļ�����Ҫ�����λ��
               File newFile = new File(localPath);  
               //�ϴ����ļ�д�뵽ָ�����ļ���  
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
