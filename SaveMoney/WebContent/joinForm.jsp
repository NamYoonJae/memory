<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원가입 페이지</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script  src="js/bootstrap.js"></script>
		<style>
			table{
				width: 500px;
			}
			font{
				font-size: 20%;
				color: red;
				height: 30px;
			}

		</style>
	</head>
	<body>
		<div align="center">
			<img alt="icon" src="./imgsample.png" width= 250px; height= 250px;/>
		</div>
		</br>
		<form action="./join" method="post" id="joinForm">
			<table  class="table table-striped table-bordered" align="center">
				<tr>
					<td align="center" colspan="2">
						<input class="form-control" type="text" id="joinId" name="joinId" maxLength="20"
							placeholder="ID" >
					</td>			
					<td align="center">
						<button id="overlay" type="button" class="">중복체크</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font name="joinId"></font>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input class="form-control" type="password" name="joinPw"  id="joinPwa" placeholder="PW" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font name="joinPw"></font>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input class="form-control" type="password" name="joinPw2"  id="joinPw2" placeholder="PW확인" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font name="joinPw2"></font>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input class="form-control" type="text" name="joinName" id="joinName" placeholder="이름" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font name="joinName"/>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input class="form-control" type="text" name="joinNumber" id="joinNumber" placeholder="핸드폰번호" "/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font name="joinNumber"></font>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input class="form-control" type="email" name="joinEmail"  id= "joinEmail" placeholder="이메일"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font name="joinEmail"></font>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<div class="genderSel">
							<div style="text-align: center; margin: 0px auto;">
								<label class="radio-inline">
									<input type="radio" name="joinGender" autocomplete="off" value="male" checked>남자
								</label>
							
								<label class="radio-inline" >
									<input type="radio" name="joinGender" autocomplete="off" value="female">여자
								</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input id="send" type="button" value="회원가입" class=""/>
					</td>
				</tr>
			</table>
		</form>	
	</body>
	<script>	

		var obj ={};
		var idchk = false;
		var pwnull=false;
		var pwchk = false;
		var namechk = false;
		var numchk = false;
		var emailchk = false;
		
		//아이디체크
		$("#joinId").keyup(function() {
			var idc = /^[a-z][a-z0-9_-]{4,11}$/;
			if(!idc.test($('#joinId').val())) {
				$('font[name=joinId]').text('영소문자로 시작하는 5~12자 영소문자,-,_, 숫자 로 이루어져야함');
				$('font[name=joinId]').css('color','red');
			} else {
				$('font[name=joinId]').text('적합한 양식입니다.');
				$('font[name=joinId]').css('color','green');
			}
		});
		
		$("#overlay").click(function(){
			obj.type="post";
			obj.url="./overlay";
			obj.data={id:$("#joinId").val()};
			obj.dataType="JSON";
			obj.success=function(d){
					if(d.msg/*받아온 true,false가 여기 들어감*/){
						alert("사용가능한 아이디");
						idchk=true;
						console.log(chk);
					}else{
						alert("사용중인 아이디");
						$("#joinId").val("");
						idchk=false;
						console.log(chk);
					}
				}
	
			obj.error=function(e){
				console.log(e);
			};
			$.ajax(obj);
		});
		
		//비밀번호
		$("#joinPwa").keyup(function() {
			var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,10}$/;
			if(!pwc.test($('#joinPwa').val())) {
				$('font[name=joinPw]').text('영문,숫자,특수문자를 최소 1자씩 사용하여 6~10자의 비밀번호를 작성하세요');
				$('font[name=joinPw]').css('color','red');
			} else {
				$('font[name=joinPw]').text('적합한 양식입니다.');
				$('font[name=joinPw]').css('color','green');
				pwnull=true;
			}
		});
		// 비밀번호 일치
		$("#joinPw2").keyup(function() {
			if($('#joinPwa').val()!=$('#joinPw2').val()) {
			$('font[name=joinPw2]').text('비밀번호 불일치');
			$('font[name=joinPw2]').css('color','red');
		} else {
			$('font[name=joinPw2]').text('비밀번호 일치');
			$('font[name=joinPw2]').css('color','green');
			pwchk=true;
		}
		});
		// 이름
		$("#joinName").keyup(function() {
			var namec = /^[가-힝]{2,}$/;
			if(!namec.test($('#joinName').val())) {
				$('font[name=joinName]').text('2자리 이상의 한글이어야 합니다.');
				$('font[name=joinName]').css('color','red');
			} else {
				$('font[name=joinName]').text('적합한 양식입니다.');
				$('font[name=joinName]').css('color','green');
				namechk=true;
			}
		});
		// 핸드폰번호
		$('#joinNumber').keyup(function() {
			var phonec = /^[0-9]{10,11}$/;
			if(!phonec.test($('#joinNumber').val())) {
			$('font[name=joinNumber]').text("'-'를 제외한 10자리 or 11자리 숫자이여야 합니다.");
			$('font[name=joinNumber]').css('color','red');
			} else {
				$('font[name=joinNumber]').text('적합한 양식입니다.');
				$('font[name=joinNumber]').css('color','green');
				numchk=true;
			}
			
		});	
		
		//이메일확인
		$('#joinEmail').keyup(function() {
			var emailc = /^[a-z0-9_-]{3,6}@([a-z]+)\.([a-z\.]{2,6})$/;
			if(!emailc.test($('#joinEmail').val())) {
			$('font[name=joinEmail]').text("영소문자,숫자,_,-로  3~6자 @뒤에는 영소문자.영소문자로 2~6자");
			$('font[name=joinEmail]').css('color','red');
			} else{
				$('font[name=joinEmail]').text('적합한 양식입니다.');
				$('font[name=joinEmail]').css('color','green');
				
				emailchk=true;
			}
			
		});	
		
		$("#send").click(function(){
			if(idchk==false){
				alert("아이디 중복체크를 해야합니다");
			}else if(pwnull== false){
				alert("비밀번호를 써야합니다.");
			}else if(pwchk == false){
				alert("비밀번호를 같게 써야합니다.");
			}else if(namechk == false){
				alert("이름을 써야합니다.");
			}else if(numchk == false){
				alert("전화번호를 써야합니다.");
			}else if(emailchk == false){
				alert("이메일을 써야합니다.");
			}else{
				console.log("submit");
				$("#joinForm").submit();
			}
			
		});     
		
		var msg="${msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>