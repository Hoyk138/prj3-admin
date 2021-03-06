<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    session="true"
    isELIgnored="false"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%
 	request.setCharacterEncoding("UTF-8");  //request.setCharacterEncoding ->POST 방식에서만 적용된다.
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.133/jsp_prj/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://211.63.89.133/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">
   
   	#notice{ font-size: 30px; font-weight: bold;}
   
   
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
    $("#searchBtn").click(function(){
	    if($("#keyword").val().trim() == ""){
		    alert("검색어를 입력해 주세요.");
			$("#keyword").focus();
			return;
		}//end if
	    $("#searchFrm").submit();
    });//click    	
    $("#btn2").click(function () {
    	location.href="question.do"
	})//click
});//ready
</script>
</head>
<body>
<div id="books">

<div id="header">

<%@ include file="../../common/jsp/admin_include_header.jsp" %>
   
</div>

<div id="container">

<div id="snb">

 <%@ include file="../../common/jsp/admin_include_snb_ebook_wc.jsp" %>
 
</div>  <!-- snb 끝  위에 ● 부분에 목록 넣으세요-->

<div id="content">

<h6>고객센터 관리 > 문의사항</h6>
<h3>문의사항 등록/수정</h3>
<br/>


<div id="Cwrap"  style="float: left; margin-left: 30px;">
<div style="font-size: 30px; font-weight: bold; margin-left: 330px; margin-top: 30px;">문의사항</div>
<br>
<div>
<form action="delete_process2.do" method="post">
<input type="hidden" name="num" value="${ question_detail.num }">
<button type="submit" class="btn btn-outline-primary btn-sm" style=" float: right;">문의 삭제</button>
</form>
</div>
<div style="margin-left: 80px; margin-top: 30px;">
<div style="border-bottom: 1px solid #333;">
${ question_detail.id }
<form action="modified_process2.do" method="post">
</div>
<div style="border-bottom: 1px solid #333;height: 30px; width: 600px;">
	<div style="float: left;width: 400px ">${ question_detail.subject }</div>
	<div style="float: left;width: 100px ;">${ fn:substring(question_detail.num,2,8) }번</div>
	<div style="float: left; width: 100px  ">${question_detail.w_day}</div>
</div>
<div style="clear:both;  width: 600px; height: 200px; id="content">
${ question_detail.content }
</div>
<div style="clear:both;  width: 600px; height: 200px; border-bottom: 1px solid #333" id="content2">
<textarea style="width: 600px; height: 200px;" name="answer">${ question_detail.answer }</textarea>
</div>
<br>
<div style="clear: both;">
<div style="margin-left: 0px;">
<button type="button" id="btn2" class="btn btn-outline-primary btn-sm" style="width: 80px">목록</button>
<button type="submit" class="btn btn-outline-primary btn-sm" style="width: 80px; float: right;">답변</button>
<!-- <input type="hidden" name="answer_flag" value="Y"> -->
<input type="hidden" name="num" value="${ question_detail.num }">
<input type="hidden" name="admin_id" value="${ admin_id }">
</div>
<br>
</div>
<br>

</div>
</div><!-- Wrap끝 -->

</form>
</div><!-- content 끝 -->

	



</div> <!-- container 끝 -->


<div id="footer">

		 <%@ include file="../../common/jsp/admin_include_footer.jsp" %>

</div>
</div>
</body>
</html>