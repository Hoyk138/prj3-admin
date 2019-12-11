package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.SearchMemberDAO;
import kr.co.jinibooks.domain.MemberDetailDomain;
import kr.co.jinibooks.domain.SearchMemberDomain;
import kr.co.jinibooks.vo.MemberVO;

public class MemberService {

	
	public List<SearchMemberDomain> SearchMemberList(MemberVO mVO) {

		List<SearchMemberDomain> list = null;

		SearchMemberDAO smDAO = SearchMemberDAO.getInstance();

		try {
			list = smDAO.selectMemberList(mVO);
			String temp = "";
			for (int i = 0; i < list.size(); i++) {
				temp = String.valueOf(list.get(i));
			} // end for

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return list;
	} // SearchMemberList
	
	
//	public MemberDetailDomain searchMember(String keyword) {
//		
//		MemberDetailDomain mdd=null;
//		
//		SearchMemberDAO smDAO = SearchMemberDAO.getInstance();
//		
//		try {
//			mdd=smDAO.selectMemberDetail();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} // end catch
//		
//	return mdd;
//	} // searchOneEmp

	
} // class
