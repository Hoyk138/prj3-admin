package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jinibooks.domain.MainNoticeListDomain;
import kr.co.jinibooks.domain.SearchMemberDomain;
import kr.co.jinibooks.service.MemberService;
import kr.co.jinibooks.vo.MemberVO;

@Controller
public class MemberController {

	@RequestMapping(value = "admin_member.do", method = GET)
	public String memberPage(Model model) {

		return "admin_member";
	}// mainPage
	
	@RequestMapping(value = "admin_member_dormant.do", method = GET)
	public String memberDormantPage(Model model) {
		
		return "admin_member_dormant";
	}// memberDormantPage
	
	@RequestMapping(value = "admin_member_search.do", method = GET)
	public String memberSearch(Model model) {
		

		
		return "admin_member_search";
	}// memberDormantPage
	
	
	

}