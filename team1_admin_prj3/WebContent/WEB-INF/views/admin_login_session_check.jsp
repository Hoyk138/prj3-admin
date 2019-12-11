<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"
%>

<%
	String admin_id = (String)session.getAttribute("admin_id") ;

	if ( admin_id == null ) {
		response.sendRedirect("admin_login.jsp") ;
	return ;
	} // end if
%>