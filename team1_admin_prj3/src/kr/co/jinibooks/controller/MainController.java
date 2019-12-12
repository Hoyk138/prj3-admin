package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jinibooks.domain.MainNoticeListDomain;
import kr.co.jinibooks.service.LoginService;
import kr.co.jinibooks.service.MainSelectService;
import kr.co.jinibooks.vo.LoginVO;

@Controller
public class MainController {

   @RequestMapping(value = "admin_login.do", method = GET)
   public String loginPage(Model model) {

      return "admin_login";
   }// mainPage
   
   @RequestMapping(value = "admin_member_grade.do", method = GET)
   public String memberGrade(Model model) {
      
      return "admin_member_grade";
   }// mainPage

   /**
    * �Է¹��� id, passwd ����
    * 
    * @param lVO
    * @param model
    * @return
    */
   @RequestMapping(value = "admin_login_process.do", method = POST)
   @ResponseBody
   public String loginProcess(LoginVO lVO, Model model) {

      LoginService ls = new LoginService();
      JSONObject json = ls.chkLogin(lVO);

      return json.toJSONString();
   }// mainPage

   
   /**
    * �α��� �������� �� id�� pass������
    * 
    * @param lVO
    * @param model
    * @return
    */
   @RequestMapping(value = "admin_main.do", method = {GET,POST})
   public String adminMain(LoginVO lVO, Model model) {

      MainSelectService ms=new MainSelectService();
      List<MainNoticeListDomain> selectMainNoticeList = ms.selectMainNoticeList();
      
      
      // session�� �ֱ� ���� annotation �޾��ֱ�
       model.addAttribute("adminId", lVO.getId()) ;

       // ���ο� �ߴ� ����
       model.addAttribute("selectCnt", ms.selectCnt()) ;
       model.addAttribute("selectJoinCnt", ms.selectJoinCnt()) ;
       model.addAttribute("selectAllCnt", ms.selectAllCnt()) ;
       model.addAttribute("selectQNA", ms.selectQNA()) ;
       model.addAttribute("selectOrderCnt", ms.selectOrderCnt()) ;
       model.addAttribute("selectOrderPrice", ms.selectOrderPrice()) ;
       model.addAttribute("selectMainNoticeList", ms.selectMainNoticeList()) ;
       
      return "admin_main";
   } // loginProcess


}// class