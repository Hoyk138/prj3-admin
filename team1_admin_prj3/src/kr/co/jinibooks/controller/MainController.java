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
    * 입력받은 id, passwd 유무
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
    * 로그인 성공했을 때 id와 pass보내기
    * 
    * @param lVO
    * @param model
    * @return
    */
   @RequestMapping(value = "admin_main.do", method = {GET,POST})
   public String adminMain(LoginVO lVO, Model model) {

      MainSelectService ms=new MainSelectService();
      List<MainNoticeListDomain> selectMainNoticeList = ms.selectMainNoticeList();
      
      
      // session에 넣기 위해 annotation 달아주기
       model.addAttribute("adminId", lVO.getId()) ;

       // 메인에 뜨는 값들
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