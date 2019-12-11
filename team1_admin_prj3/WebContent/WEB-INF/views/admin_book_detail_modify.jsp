<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    session="true"
    isELIgnored="false"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");  //request.setCharacterEncoding ->POST 방식에서만 적용된다.
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book 상세 및 수정</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">

   #registImage{  width: 200px; height: 500px;  padding-top:70px; float:left;  /* border: 1px solid #333; */ }
   #bookbutton{  width: 200px; height: 100px; padding: 10px; /* text-align: center; */ margin-left: 60px; }
   #registForm{  width: 400px; height: 500px; padding-left: 15px; padding-top:10px; margin-left: 220px;/*  border: 1px solid #333; */}
   #registButton{height: 100px; margin-left: 350px;}
   #subjectText{ font-size: 15px;  font-weight: bold;}
   #form-group col-md-4{ width: 200px;}
   
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript"> 
$(function(){
	
	$("#bookUpdate").click(function(){
		
		//JavaScript로 charset Encoding 함수 : encodeURI()
		/* alert($("#book_code").val());
		alert(encodeURI( $("#book_code").val()));
		var param="img="+encodeURI( $("#img").val() ) +"&category_code="+encodeURI( $("#category_code").val() )+"&book_code="+encodeURI( $("#book_code").val() )
					+"&title="+encodeURI( $("#title").val() ) +"&author="+encodeURI( $("#author").val() ) +"&translator="+encodeURI( $("#translator").val() ) 
					+"&company="+encodeURI( $("#company").val() ) +"&sale_class="+encodeURI( $("#sale_class").val() ) +"&sale_state="+encodeURI( $("#sale_state").val() ) 
					+"&intro="+encodeURI( $("#intro").val() ) +"&review="+encodeURI( $("#review").val() ) +"&author_intro="+encodeURI( $("#author_intro").val() ) 
					+"&book_index="+encodeURI( $("#book_index").val() ) +"&sale_price="+encodeURI( $("#sale_price").val() ) +"&rental_price="+encodeURI( $("#rental_price").val() );  */
		
		var form = document.getElementById('bookDetailModify');
		//FormData parameter에 담아줌
		form.method = "POST";
		form.enctype = "multipart/form-data";
		
		var formData = new FormData(form);
		alert(formData);
					
		$.ajax({
			url:"admin_book_detail_modify_process.do",
			type:"post",
			enctype: 'multipart/form-data',
			processData: false,
            contentType: false,
			data: formData,
			dataType: "json",
			error: function(xhr) {
				alert("상품 정보 수정에 실패하였습니다. 잠시후 다시 시도해 주세요");
				console.log("에러코드 : "+xhr.status);
				console.log("에러메세지 : "+xhr.statusText);
			},
			success: function( json_obj ){
				//alert(json_obj);
				var flag=json_obj.updateResult;
				if( flag ) {
				    alert("상품 정보 수정에 성공하였습니다");
					$("#updateSuccess").submit();
				    
				}else{
				    alert("상품 정보 수정에 실패하였습니다");
				}//end if
			}
		})//ajax
	});//click
	$("#bookDelete").click(function(){
		var param="book_code="+encodeURI( $("#book_code").val() );
		alert($("#book_code").val());
		$.ajax({
			url:"admin_book_delete_process.do",
			type:"post",
			data:param,
			dataType: "json",
			error: function(xhr) {
				alert("상품 정보 삭제에 실패하였습니다. 잠시후 다시 시도해 주세요");
				console.log("에러코드 : "+xhr.status);
				console.log("에러메세지 : "+xhr.statusText);
			},
			success: function( json_obj ){
				var flag=json_obj.deleteResult;  
				if( flag ) {
				    alert("상품 정보가 삭제되었습니다.");
				    $("#deleteSuccess").submit();
				}else{
				    alert("상품 정보 삭제에 실패하였습니다");
				}//end if
			}
		})//ajax
	});//click
	
	//이미지를 선택 했을 때 유효성을 확인하고 화면에 보여주는 JavaScipt 시작
	$("#upfile").on("change", handleImgFileSelect1);
	var sel_file1;
	function handleImgFileSelect1(e){
		////////// 이미지 유효성 확인 시작 //////////
		var upfile=$("#upfile").val();
		/* 보안의 이슈가 있기때문에 파일은 alert창만 띄워줌 */
		if(upfile=="") {
			alert("파일을 선택해주세요");
			return;
		}//end if
		
		//확장자가 java, class, jsp, xml은 업로드를 막기
		//서버에서 실행될 수 있는 언어는 업로드를 제한한다
		var blockExt=["java","class","jsp","xml"]; 
		//확장자
		var ext=$("#upfile").val().split("."); //"."을 기준으로 배열방 만듦
		var extFlag=false;
		extTemp=ext[ext.length-1].toLocaleLowerCase(); /* . 으로 나눠져 구성된 배열 중 마지막방 */
		for(var i=0; i < blockExt.length ; i++) {
			if( blockExt[i]==extTemp) {
				extFlag=true;
				break;
			}//end if
		}//end for
		
		if(extFlag) {
			alert(ext+"는 업로드 불가능한 파일 입니다.");
			return;
		}//end if
		
	   var files = e.target.files;
	   /* console.log(files[0]); */
	   var fileArr = Array.prototype.slice.call(files);
	   
	   fileArr.forEach(function(f){
	      if(!f.type.match("image.*")){
	         alert("확장자는 이미지 확장자만 가능합니다.");
	         return;
	      }//end if
	      
	      //sel_file1 = f;
	      
          //////////이미지 화면에 보여주기 //////////
	      var reader = new FileReader();
	      reader.onload = function(e){
	         $("#viewImg").attr("src", e.target.result);
	      }
	      reader.readAsDataURL(f);
	   });
	}//handleImgFileSelect
	

});//ready
</script>
</head>
<body>
<div id="books">

<div id="header">

 <%@ include file="../../common/jsp/admin_include_header.jsp" %>
   
</div> <!-- header 끝 -->

<div id="container">

	<div id="snb">
	
	 <%@ include file="../../common/jsp/admin_include_snb_ebook_list.jsp" %>
	
	</div>

	<div id="content">
		
		<h6>e-book 관리 > e-book 리스트 > e-book 상세 및 수정</h6>
		<h3>| e-book 상세 및 수정</h3>
		<br/>
		
		<form action="admin_book_detail_modify.do" id="updateSuccess" >
			 <input type="hidden" name="book_code" value="${param.book_code }"> <!-- 수정 성공 후 상세정보 보기위한 북코드 -->
		</form>
		
		<form action="admin_book_list.do" id="deleteSuccess" > <!-- 삭제 성공후 북 리스트로 이동하기 위한 폼 -->
			 <input type="hidden" name="book_code" value="${param.book_code }"> 
		</form>
		
		
		<form action="admin_book_detail_modify_process.do"  id="bookDetailModify" name="bookDetailModify" method="post">
		<input type="hidden" name="book_code" id="book_code" value="${param.book_code }"> <!--  수정할 때 값 넘겨주는 북코드 -->
		<%-- <c:out value="${param.book_code }"></c:out> --%>
		<div id="bookResist"> 
			<div style="margin-left: 300px">
			<div id="registImage">
				
				<img id="viewImg"src="http://localhost:8080/team1_admin_prj3/common/images/book/${ cateEnglish }/${ bookDetailData.img }" width="200px" height="250px"/>
				
				
			    <!-- RFC 1867 HTML Form 기반의 파일 업로드 -->
				<input type="file" name="upfile" id="upfile" class="inputBox" style="width: 200px; margin-top: 15px;"><br/>
				<input type="hidden" id="img" name="img" value="${bookDetailData.img }" />
				
			</div> <!-- registImage 끝 -->
			
							
				<!-- 인풋타입 파일에는 벨류설정불가 히든으로 파일명을 넣어놔 
				파일변경시 누르면 파일업로드를 수행한다음
				변경된 파일명을
				파라메터로 한꺼번에 받을 수 있으면 히든 필요X
				못받으면 히든이 필요 -->
			
			<div id="registForm">
			
		  		<div class="form-row">
			    	<div class="form-group col-md-4">
			    	<label><span id="subjectText">카테고리</span></label> 
				      <select id="category_code" name="category_code" class="form-control" style="width:200px;">
				        <%-- <option><c:out value="${bookDetailData.category_code }"/></option> --%> 
				        <!-- param / bookDetailData의 차이 ?-->
				        <option value="BC_000001"${ bookDetailData.category_code eq 'BC_000001'?" selected='selected' ":""}><c:out value="소설"/></option> 
						<option value="BC_000002"${ bookDetailData.category_code eq 'BC_000002'?" selected='selected' ":""}><c:out value="경영/경제"/></option> 
						<option value="BC_000003"${ bookDetailData.category_code eq 'BC_000003'?" selected='selected' ":""}><c:out value="인문/사회/역사"/></option> 
						<option value="BC_000004"${ bookDetailData.category_code eq 'BC_000004'?" selected='selected' ":""}><c:out value="자기계발"/></option> 
						<option value="BC_000005"${ bookDetailData.category_code eq 'BC_000005'?" selected='selected' ":""}><c:out value="에세이/시"/></option> 
						<option value="BC_000006"${ bookDetailData.category_code eq 'BC_000006'?" selected='selected' ":""}><c:out value="여행"/></option> 
						<option value="BC_000007"${ bookDetailData.category_code eq 'BC_000007'?" selected='selected' ":""}><c:out value="컴퓨터/IT"/></option> 
						<option value="BC_000008"${ bookDetailData.category_code eq 'BC_000008'?" selected='selected' ":""}><c:out value="건강/다이어트"/></option> 
						<option value="BC_000009"${ bookDetailData.category_code eq 'BC_000009'?" selected='selected' ":""}><c:out value="만화"/></option> 
				      </select>
				    </div>
				  </div>
				 
				 <div class="form-row">
					<div class="form-group col-md-6">
					<label><span id="subjectText">도서명</span></label> 
			      		<input type="text" class="form-control" id="title" name="title" value="${bookDetailData.title }" style="width:380px;">
			    	</div>  
		  		</div>
		  		
				<div class="form-row">
					<div class="form-group col-md-6">
				  		<label><span id="subjectText">저자</span></label> 
				  		<input type="text" class="form-control" id="author"  name="author" value="${bookDetailData.author }">
			  		</div> 
					<div class="form-group col-md-6">
				  		<label><span id="subjectText">번역</span></label> 
				  		<input type="text" class="form-control" id="translator"  name="translator"  value="${bookDetailData.translator }">
			  		</div> 
		  		</div>
		  		
				<div class="form-row">
			  		<div class="form-group col-md-6">
			  			<label ><span id="subjectText">출판사</span></label>
			      		<input type="text" class="form-control" id="company"  name="company"  value="${bookDetailData.company }">
			    	</div>  
			    	 <div class="form-group col-md-4">
				      <label for="inputState"><span id="subjectText">판매상태</span></label>
				      <select id="sale_state"  name="sale_state"  class="form-control" style="width:190px;">
						<option value="y"${ bookDetailData.sale_state eq 'y'?" selected='selected' ":""}><c:out value="판매"/></option> 
						<option value="n"${ bookDetailData.sale_state eq 'n'?" selected='selected' ":""}><c:out value="절판"/></option> 
				      </select>
				    </div>
			  	</div>
			  	
				<div class="form-row">
				    <div class="form-group col-md-4">
				      <label for="inputState"><span id="subjectText">판매분류</span></label>
				      <select id="sale_class"  name="sale_class"  class="form-control" style="width:100px;">
						<option value="p/r"${ bookDetailData.sale_class eq 'p/r'?" selected='selected' ":""}><c:out value="전체"/></option> 
						<option value="p"${ bookDetailData.sale_class eq 'r'?" selected='selected' ":""}><c:out value="구매"/></option> 
						<option value="r"${ bookDetailData.sale_class eq 'r'?" selected='selected' ":""}><c:out value="대여"/></option> 
				      </select>
				    </div>
				    
				    <div class="form-group col-md-4">
			      	  <label for="bookPrice"><span id="subjectText">판매가격</span></label>
			          <input type="text" class="form-control" id="sale_price"  name="sale_price"  value="${bookDetailData.sale_price }" style="width:100px;">
			    	</div>
			    	
			    	<div class="form-group col-md-4">
			      	  <label for="bookPrice"><span id="subjectText">대여가격</span></label>
			          <input type="text" class="form-control" id="rental_price"  name="rental_price"  value="${bookDetailData.rental_price }" style="width:100px;">
			    	</div>
			  	</div>
			  	
			</div> <!-- registForm 끝 -->
			</div>
		</div> <!-- bookResist 끝 -->

	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">책 소개</label>
	    <textarea class="form-control" id="intro"  name="intro"  style="height: 300px">
	    <c:out value="${bookDetailData.intro }"></c:out>
	    </textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">출판사 서평</label>
	    <textarea class="form-control" id="review"  name="review"   style="height: 300px">
		<c:out value="${bookDetailData.review }"></c:out>
	    </textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">저자 소개(프로필)</label>
	    <textarea class="form-control" id="author_intro"  name="author_intro" style="height: 300px">
	    <c:out value="${bookDetailData.author_intro }"></c:out>
	    </textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleFormControlTextarea1">목차</label>
	    <textarea class="form-control" id="book_index"  name="book_index" style="height: 150px">
		<c:out value="${bookDetailData.book_index }"></c:out>
	    </textarea>
	  </div>
	
		<div id="registButton" style="margin-left: 500px;">
			<input type="button" class="btn btn-primary btn-lg" id="bookUpdate" value="수정"/>
			<input type="button" class="btn btn-danger btn-lg" id="bookDelete" value="삭제"/>
		</div>
	</form>
	
	</div><!-- content 끝 -->
</div> <!-- container 끝 -->

 <%@ include file="../../common/jsp/admin_include_footer.jsp" %>

</div>
</body>
</html>