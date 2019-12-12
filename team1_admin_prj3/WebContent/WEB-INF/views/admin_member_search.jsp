<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="" session="true" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css"
	href="http://211.63.89.133/jsp_prj/common/css/main.css" />
<style type="text/css">
#books {
	height: 1100px;
	margin: 0px auto;
}
/* 헤더 시작 */
#header {
	height: 200px;
	position: relative;
	background: #F58E69
}
#hContent {
	width: 700px;
	height: 90px;
	padding-top: 10px;
	position: absolute;
	top: 20px;
	left: 50px;
}

#naviBar {
	height: 80px;
	top: 120px; /* position: absolute;  top: 100px; */
}
/* 헤더 끝 */

/* 컨테이너 시작 */
#container {
	width: 900px;
	height: 1000px;
}
/* 컨테이너 끝 */

/* 푸터 시작 */
#footer {
	height: 150px;
	background-color: #FFEBE3;
}
#fContent {
	width: 670px;
	height: 110px;
	padding-top: 40px;
	padding-left: 30px;
	float: center;
}

#fContentInfo {
	height: 150px;
	font-size: 13px;
	padding-left: 80px;
	margin-top: 15px;
}
/* 푸터 끝 */
#hTitle {
	font-family: '고딕';
	font-size: 30px;
	font-weight: bold;
	color: #FFFFFF
}

</style>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<div id="books">
		<div id="header">
			<div id="hLogo">
				<div id="hContent">
					<span id="hTitle">JINI BOOKS</span>
				</div>

			</div>

			<nav id="naviBar" class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="#">HOME</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">회원관리</a></li>
						<li class="nav-item"><a class="nav-link" href="#">E-Book관리</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">구매/대여관리</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">정산관리</a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판관리</a></li>

					</ul>
				</div>
			</nav>

		</div>

		<div id="container">
		
			<div id="member_left" style="float: left; width: 250px; height: 1015px; background-color: #ECECED">
				<div class="sidebar-sticky" align="center">
					<img src="../common/images/member.png" />
		
					<h4 style="background-color: #F57244; width: 160px; height: 30px;">
						<strong>회원 관리</strong>
					</h4>
	
					<ul class="member-column1" style="text-align: left; margin-left: 30px">
	
						<li class="nav-item">
						<a class="nav-link" href="#" ><span style="font-size: 15px"><strong>회원 조회 /수정</strong></span></a>
						</li>
	
						<li class="nav-item">
						<a class="nav-link" href="#"><span style="font-size: 15px">휴면 회원 관리</span></a>
						</li>
					</ul>
				</div>
			</div>
				
				
			<div id="member_right" style="width: 650px; height: 830px; margin-left: 250px; padding: 20px;">
				
			<div style="text-align: center">
				<h2><strong>회원 정보 관리</strong></h2>
				<hr width="90%" align="center"/>
			</div>
			
			<div style="margin:30px">
				<img src="../common/images/search_member.png" style="float: left"/>
				<h5><strong>&nbsp;회원 상세 정보</strong></h5>
			</div>
			
			<div id="member_info_tab">
			<table class="table table-bordered" style="text-align: center; width: 600px; margin-left: 10px;">
			<tbody>
				<tr>
					<th style="background-color: #ECECED">이름</th>
					<td>윤소인</td>
					<th style="background-color: #ECECED">나이</th>
					<td>28</td>
					<th style="background-color: #ECECED">성별</th>
					<td>여성</td>
				</tr>
				<tr>
					<th style="background-color: #ECECED">아이디</th>
					<td>test</td>
					<th style="background-color: #ECECED">비밀번호</th>
					<td>**********</td>
					<th style="background-color: #ECECED">가입 일자</th>
					<td>2019-11-01</td>
				</tr>
				<tr>
					<th style="background-color: #ECECED">총 충전 금액</th>
					<td>20,000</td>
					<th style="background-color: #ECECED">사용금액</th>
					<td>30,0000</td>
					<th style="background-color: #ECECED">등급</th>
					<td>GOLD</td>
				</tr>
				<tr>
					<th style="background-color: #ECECED" colspan="3">전화번호</th>
					<td colspan="3">010-1234-5678</td>
				</tr>
				<tr>
					<th style="background-color: #ECECED" colspan="3">이메일</th>
					<td colspan="3">test@test.com</td>
				</tr>
			</tbody>
			</table>
			</div>
			
			<div id=member_info_tab style="margin-left: 20px; margin-top: 20px">
			<h5><strong>[test]님이 최근 주문하신 내역</strong></h5>
			<table class="table table-bordered" style="text-align: center; width: 600px">
			  <thead>
			    <tr>
			    <th scope="col">주문 번호</th>
				<th scope="col">상품명</th>
				<th scope="col">수량</th>
				<th scope="col">금액</th>
				<th scope="col">결제 방식</th>
				<th scope="col">주문 일자</th>
			    </tr>
			  </thead>
			  <tbody>
				<%
				 for (int i  = 0; i < 10; i++){ 
				%>
			    <tr>
			      <td>Mark</td>
			      <td>Mark</td>
			      <td>Mark</td>
			      <td>Mark</td>
			      <td>Mark</td>
			      <td>Mark</td>
			    </tr>
			  <%
			  }
			  %>
			  </tbody>
			</table>
			
			</div>
			
			<div style="width: 600px; height: 50px; margin-top: 10px; margin-left: 200px; float: left">
				<input type="button" class="btn btn-secondary" value="수정" style="width: 100px"/>
				<input type="button" class="btn btn-secondary" value="닫기" style="margin-left: 50px; width: 100px"/>
			</div>
			
			
			</div>
		</div>

			<div id="footer">
				<!-- 900(w) x 150(h) -->
				<div id="fLogo"></div>

				<div id="fContentInfo" class="col-6">
					<br />
					<p>
						&nbsp;상호명 : JINI BOOKS | 대표 : 김호진 | 주소 : 서울 강남구 테헤란로 132 8층(역삼동, 한독빌딩) | 개인정보보호책임자 : 윤소인 <br />
						&nbsp;사업자등록번호 : 123-45-12345 |통신판매업신고 : 제 1111-11111호 <br />
						&nbsp;호스팅 서비스사업자 : 지니북스(주) <br />
					<p />
					<font color="#515151">&nbsp; &copy;CopyRight. All Right	Reserved.</font>
				</div>

			</div>
		</div>
</body>
</html>