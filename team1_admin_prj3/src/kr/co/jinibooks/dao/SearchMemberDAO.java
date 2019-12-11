package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.SearchMemberDomain;
import kr.co.jinibooks.vo.MemberVO;

public class SearchMemberDAO {

	private static SearchMemberDAO smDAO;
	private static SqlSessionFactory ssf;

	private SearchMemberDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	} // CpempDAO

	public static SearchMemberDAO getInstance() {

		if (smDAO == null) {
			smDAO = new SearchMemberDAO();
		} // end if

		return smDAO;
	} // getInstance

	public SqlSessionFactory getSessionFactory() throws IOException {

		if (ssf == null) {

			Reader reader = null;
			try {
				// MyBatis ���
				// 1. ������ xml�� Stream���� ����
				reader = Resources.getResourceAsReader("kr/co/sist/dao/mybatis-config.xml");

				// 2. SqlSessionFactoryBuilder ����
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();

				// 3. SqlSessionFactory ���
				ssf = ssfb.build(reader);

			} finally {
				if (reader != null) {
					reader.close();
				} // end if
			} // end finally

		} // end if

		return ssf;
	} // getSessionFactory

	public List<SearchMemberDomain> selectMemberList(MemberVO mVO) throws SQLException {

		List<SearchMemberDomain> list = null;

		try {
			// MyBatis Handler ���
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("selectMemberList", mVO);

			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return list;
	} // selectMemberList
	
	
//	// �󼼺��Ⱑ �ʿ��Ѱ�? �׳� Ŭ���ؼ� �޸� �ٲٱ� / ��� alert�� ����ָ� �ȵǳ�?
//	public MemberDetailDomain selectMemberDetail()  throws SQLException {
//		MemberDetailDomain mdd = null;
//		
//		try {
//		// MyBatis Handler
//			SqlSession ss = getSessionFactory().openSession();
//			mdd = ss.selectOne("selectMemberDetail") ;
//			ss.close();
//			
//		} catch (IOException ioe) {
//			ioe.printStackTrace();
//		} // end catch
//		
//	return mdd;
//	} // selectMemberDetail

} // class
