<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>

	</style>
</head>
	<body>
		<div class="dropdown">
			
			 	<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
  					<span class="caret"></span>
  				</button>
			 	<div id="myDropdown" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    	<a href="#" class="dropdown-item">달력</a>
				    <a href="#" class="dropdown-item">장기 계획</a>
				    <a href="#" class="dropdown-item">통계</a>
				    <a href="#" class="dropdown-item">탭 설정</a>
				    <a href="#" class="dropdown-item">탭 추가 및 삭제</a>
			 		<a href="adminList.jsp" id= "adminList">관리자용 회원 리스트</a>
			  	</div>
			  	<img src="#" alt="icon" id="loginBoxicon"/>		
		</div>
	</body>
	<script>
	
		/* $(document).ready(function(){
			$.ajax({
				type:"get",
				url:"./adminconfirm",
				dataType:"json",
				success:function(data){
					console.log(data.result);
					if(data.result==1){//관리자 계정
						$("#adminList").css("display","block");
						var content1 = "관리자 계정입니다";
						var content2 = "<a href='./logout'>로그 아웃</a>";
						document.getElementById("mypage").innerHTML=content1;
						document.getElementById("loginBox2").innerHTML=content2;
					}else if(data.result==0){//일반계정
						var content1 = loginId+"님 반갑습니다.";
						var content2 = "<a href='./logout'>로그 아웃</a>";
						document.getElementById("mypage").innerHTML=content1;
						document.getElementById("loginBox2").innerHTML=content2;
					}
				},
				error:function(error){
					console.log(error);
				}
			});
		}); */

/* 		var loginId="${sessionScope.loginId}";
		if(loginId ==""){
			alert("로그인이 필요한 서비스입니다.");
			location.href="index.jsp";	
		} */
		
	</script>
</html>