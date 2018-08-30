<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<link rel="stylesheet" href="css/bootstrap.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script  src="js/bootstrap.js"></script>
	<title>Insert title here</title>
	<style>
		#loginBoxMain{
			width : 100%;
			heigh : 100%;
			border: 1px solid;
			position : relative;
		}
		
		#loginBoximg{
			position: absolute;
			top : 12%;
			left : 40%;
			width : 250px;
			height: 50px;
			background-color: yellow;
		}

		#loginBox2{
			position :absolute;
			width : 100px;
			 float : left;
			 right : 5px;
		} 
		#myDropdown{
			position :absolute;
			width : 400px;
			
		}
		
		.dropimg{
			width : 50px;
			height: 50px;
		}
		/* The container <div> - needed to position the dropdown content */
		/* 드롭다운 될 메뉴들의 위치 */
		.sidedropdown {
		    position: relative;
		    display: inline-block;
		    float : left;
		    left :0%;
		    width : 100%;
		    height : 80px;
		}

		/* Dropdown Content (Hidden by Default) */
		/* 드롭다운되는 메뉴들의 속성 */
		.dropdown-content, .drop-mypage {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		}

		/* Links inside the dropdown */
		/*드롭다운 하위 링크메뉴들의 속성*/
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}

		/* Change color of dropdown links on hover */
		.dropdown-content a:hover {background-color: #f1f1f1}

		/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
		/* 드롭다운을 시킬 이미지(버튼)를 클릭하면 드롭다운메뉴들 보여주기 */
		.show {display:block;}
		
		
		/* 회원정보 관련 css*/
		
		#loginBox1{
			position :absolute;
			width : 400px;
			left : 60%;
			
		}
		
		.drop-mypage a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		.dropbtn{
			position : absolute;
			left : 60%;
			top : 30%;
			width : 150px;
			height: 30px;
		}
		.drop-mypage a:hover {background-color: #f1f1f1}
		
		/*관리자 리스트 부분*/
		#adminList{
			display: none;
		}
		
		ul{list-style:none;}
			a{text-decoration:none;}
			.home_subject_notice{width: 567px;    float:left;}    
			.home_subject_notice {position: absolute; width: 567px;   float:left; left:8%; top: 50%;}
			.home_subject_notice>li>a {
			 	display:block;
				position : absolute;
			    width:78px;
			    text-align:center;
			    background:#ffffff;
			    color:#555;
			    border:1px solid #dce3e9;
			    border-bottom:0;
			    padding:7px 16px;
			    font-weight:bold;
			    margin-left: 40px;
			}
			.home_subject_notice>li.on>a {background:#efb300; color:#fff;   border:1px solid #efb300;}
			.home_subject_notice>li:first-child>a {left:0;}
			.home_subject_notice>li+li>a {left:110px;}
			.home_subject_notice>li>div {height:0; overflow:hidden; position:absolute;}
			.home_subject_notice>li.on>div { border:1px solid #dce3e9; float:left; width: 566px; height:140px; margin-top:36px; border-top:#efb300 2px solid;}
		
	</style>
</head>
	<body>
		<div id="loginBoxMain">
			<div class="sidedropdown">
			 	<img src="sidemenu.jpg" alt="dropdown" onclick="myFunction1()" class="dropimg"></img>
			 	<div id="myDropdown" class="dropdown-content">
			    	<a href="./calendar.jsp">달력</a>
				    <a href="longTermPlan.jsp">장기 계획</a>
				    <a href="#">통계</a>
				    <a href="#">탭 설정</a>
				    <a href="#">탭 추가 및 삭제</a>
			 		<a href="adminList.jsp" id= "adminList">관리자용 회원 리스트</a>
			  	</div>
			  	<img src="./imagefolder/logo.png" alt="loginboxicon" id="loginBoximg" onclick="location.href='main.jsp'"/>
			  	<button id="mypage" class="dropbtn" onclick="myFunction2()"></button>
			  	<div id="loginBox1"  class="drop-mypage">
			  		<a href="./mypage.jsp" >마이 페이지</a>
				    <a href="./memDel">회원 탈퇴</a>
				</div>
			  	<div id="loginBox2"></div>
			  	<ul class="home_subject_notice">
					<li class="on">
	            	<a href="#">1번</a>
					</li>
					<li>
						<a href="#">2번</a>
					</li>
				</ul>
			</div>
			
		</div>
	</body>
	<script>
		$(document).ready(function(){
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
		});

		var loginId="${sessionScope.loginId}";
		if(loginId ==""){
			alert("로그인이 필요한 서비스입니다.");
			location.href="index.jsp";	
		}
		/* When the user clicks on the button, 
		toggle between hiding and showing the dropdown content */
		/*아이디가 myDropdown 인 곳에 show라는 클래스가 추가/삭제가 반복됨*/
		function myFunction1() {
		    document.getElementById("myDropdown").classList.toggle("show");
		}
		
		function myFunction2() {
		    document.getElementById("loginBox1").classList.toggle("show");
		}

		// Close the dropdown menu if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.dropimg')) {

		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
		
		window.onclick = function(event) {
			  if (!event.target.matches('.dropbtn')) {

			    var dropdowns = document.getElementsByClassName("drop-mypage");
			    var i;
			    for (i = 0; i < dropdowns.length; i++) {
			      var openDropdown = dropdowns[i];
			      if (openDropdown.classList.contains('show')) {
			        openDropdown.classList.remove('show');
			      }
			    }
			  }
			}
		
		//탭 부분
		$( ".home_subject_notice>li>a" ).click(function() {
	        $(this).parent().addClass("on").siblings().removeClass("on");
	        return false;
	    });
	</script>
</html>