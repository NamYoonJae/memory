<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MyPage</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script  src="js/bootstrap.js"></script>
	<style>
		#mypageMain{
			position :absolute;
			top : 20%;
			text-align: center;
			left : 40%;	
		}
		img{
			width : 150px;
			height : 150px;
		}
		.memEdit{
			display: none;
		}
		.mypage1{
			display: inline;
		}
		table{
			width: 500px;
		}	
		font{
				font-size: 20%;
				color: red;
			}
			
	/*탈퇴 팝업창*/
		.delPopup{
			display: none;
		    width : 300px;            
		    height : 300px;
		    background-color: gray;
		    position : absolute;
		    top : 30%;
		    left : 45%;
		    z-index: 1;
		}
	</style>
	</head>
	<body>
		<jsp:include page="loginBox.jsp"></jsp:include>
		<div id="mypageMain" align="center">
			<img src="#" alt="mypageicon" value="icon"></img>
			<table align="center" class="table table-striped table-bordered">
				<tr class="mypage">
					<td >
						<input type="text" class="form-control"  value="ID" readonly="readonly" name="editId" id="editId" size="40"/>
					</td>
				</tr>
				<tr class="mypage">
					<td>
						<input type="text" class="form-control" value="PW" readonly="readonly" name="editPw" id="editPw" size="40"/>
					</td>
				</tr>
				<tr class="mypage">
					<td>
						<font name="editPw"></font>
					</td>
				</tr>
				<tr class="mypage">
					<td>
						<input type="text" class="form-control" value="NAME" readonly="readonly" name="editName" id="editName" size="40"/>
					</td>
				</tr>
				<tr class="mypage">
					<td>
						<font name="editName"></font>
					</td>
				</tr>	
				<tr class="mypage">
					<td>
						<input type="text" class="form-control" value="Phone No." readonly="readonly" name="editPhone" id="editPhone" size="40"/>
					</td>
				</tr>
				<tr class="mypage">
					<td>
						<font name="editNumber"></font>
					</td>
				</tr>	
				<tr class="mypage">
					<td>
						<input type="text" class="form-control" value="E-mail" readonly="readonly" name="editEmail" id="editEmail" size="40"/>
					</td>
				</tr>
				<tr class="mypage">
					<td>
						<font name="editEmail"></font>
					</td>
				</tr>	
			</table>
			<input type="button" class="mypage1 " onclick="updateView()" value="수정 및 탈퇴"/>
			<input type="button" class="mypage1 " onclick="location.href='main.jsp'" value="메인으로 이동"/></br>
			<input type="button" class="memEdit " onclick="save()" value="수정완료"/>
			<input type="button" class="memEdit " onclick="delPopup()" value="탈퇴하기"/>
			<input type="button" class="memEdit " onclick="cancel()" value="취소"/>
		</div>
		<div class=delPopup>
			<br/><h4>비밀번호를 입력하세요.</h4>
			<form action="./memDel" name= "delForm" method="post" onSubmit="return check()">
				<h4><input type="password" name="delPw" placeholder="비밀번호를 입력해주세요" size="25"/></h4>
				<input type="submit" value="회원탈퇴" />
				<input type="button" value="취소" onclick="popupClose()"/>
			</form>
		</div>
	</body>
	<script>

		var obj={};
		var idx;
		obj.type="post";
		obj.dataType="JSON";
		obj.error=function(error){console.log(error)};
		
		//사용자의 정보 가져오기
		$(document).ready(function(){
			obj.url="./memView";
			obj.success=function(data){
				console.log(data.succes);
				if(data.success == -1){
					alert("로그인 후 장시간 사용하지 않아 자동 로그아웃 되었습니다 \r\n 로그인 페이지로 이동합니다.");
					location.href="index.html";
				}else if(data.success == 0){
					alert("게시글을 불러오는데 실패했습니다.");
					location.href="main.html";
				}else{
					printInfo(data.dto);
				}
			};
			ajaxSend(obj);
		});
		//출력하기
		function printInfo(info){
			id = info.id;
			$("input[name='editId']").val(info.memberid);
			$("input[name='editPw']").val(info.memberpw);
			$("input[name='editName']").val(info.memberName);
			$("input[name='editPhone']").val(info.memberPhone);
			$("input[name='editEmail']").val(info.memberEmail);
		}
		
		//수정하기 버튼 클릭시
		function updateView(){
			console.log("회원 정보 수정 버튼 클릭");
			
			$(".memEdit").css("display","inline");
			$(".form-control").attr("readonly",false);
			$(".mypage1").css("display","none");
			$("#editId").attr("readonly",true);
			
		}
			
		//수정완료 버튼 클릭시
		function save(){
			if(pwnull== false){
				alert("비밀번호를 써야합니다.");
			}else if(namechk == false){
				alert("이름을 써야합니다.");
			}else if(numchk == false){
				alert("전화번호를 써야합니다.");
			}else if(emailchk == false){
				alert("이메일을 써야합니다.");
			}else{
				obj.url="./memUpdate";
				obj.data={
						pw: $("#editPw").val(),
						name: $("#editName").val(),
						phone: $("#editPhone").val(),
						email: $("#editEmail").val(),
						
				};
				obj.success=function(data){
					console.log(data);
					if(data.success==1){
						alert("수정완료");
						updateComple();
						printInfo(data.dto);
					}else{
						alert("수정실패");
					}
				};
				ajaxSend(obj);
				
			}
		}

		//수정완료 성공시
		function updateComple(){
			$(".memEdit").css("display","none");
			$(".edit").attr("readonly",true);
			$(".mypage1").css("display","inline");
			$("#editId").attr("readonly",true);
		}

		//ajax로 보내기 명령어
		 function ajaxSend(json){
				$.ajax(json)
			}

		//비밀번호
		$("#editPw").keyup(function() {
			var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,10}$/;
			if(!pwc.test($('#editPw').val())) {
				$('font[name=editPw]').text('영문,숫자,특수문자를 최소 1자씩 사용하여 6~10자의 비밀번호를 작성하세요');
				$('font[name=editPw]').css('color','red');
			} else {
				$('font[name=editPw]').text('적합한 양식입니다.');
				$('font[name=editPw]').css('color','green');
				pwnull=true;
			}
		});

		// 이름
		$("#editName").keyup(function() {
			var namec = /^[가-힝]{2,}$/;
			if(!namec.test($('#editName').val())) {
				$('font[name=editName]').text('2자리 이상의 한글이어야 합니다.');
				$('font[name=editName]').css('color','red');
			} else {
				$('font[name=editName]').text('적합한 양식입니다.');
				$('font[name=editName]').css('color','green');
				namechk=true;
			}
		});

		// 핸드폰번호
		$('#editPhone').keyup(function() {
			var phonec = /^[0-9]{10,11}$/;
			if(!phonec.test($('#editPhone').val())) {
			$('font[name=editNumber]').text("'-'를 제외한 10자리 or 11자리 숫자이여야 합니다.");
			$('font[name=editNumber]').css('color','red');
			} else {
				$('font[name=editNumber]').text('적합한 양식입니다.');
				$('font[name=editNumber]').css('color','green');
				numchk=true;
			}
			
		});	
		
		//이메일확인
		$('#editEmail').keyup(function() {
			var emailc = /^[a-z0-9_-]{4,7}@([a-z]+)\.([a-z\.]{2,6})$/;
			if(!emailc.test($('#editEmail').val())) {			
				$('font[name=editEmail]').text("영문 소문자, 숫자와 특수기호(_),(-)로  4~7자 @뒤에는 영소문자.영소문자로 2~6자");
				$('font[name=editEmail]').css('color','red');
				} else {
				$('font[name=editEmail]').text('적합한 양식입니다.');
				$('font[name=editEmail]').css('color','green');
				emailchk=true;			
				}			
		
		});
		
	//팝업 관련 함수	
		function delPopup(){
			$(".delPopup").css("display","block");
		}
		
		function popupClose(){
			$(".delPopup").css("display","none");
			
		}
		
		function check(){
			if(!document.delForm.delPw.value){
				alert("비밀번호를 입력해주세요");
				return false;
			}
		}
		
		function cancel(){
			location.href="./main.jsp";
		}
	</script>
</html>