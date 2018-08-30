<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>LoginPage</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script  src="js/bootstrap.js"></script>
		<style>
			table,td{
				width : 500px;
			}

		</style>
	</head>
	<body>
		<div align="center" >
		<img alt="icon" src="./imagefolder/loginBoxImgSample.png"/>
		</div>
		<br/>
		<form action="./login" method="post" >
			<table  class="table table-striped table-bordered" align="center">
				<tr>
					<td >
						<input name= "loginId" type="text" placeholder="ID"  class="form-control"/> 
					</td>
				</tr>
				<tr>
					<td >
						<input name= "loginPw" type="password" placeholder="PW"  class="form-control"/> 
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
						<input id="login" type="submit" value="login" class=""/>
						<input type="button" value="join" onclick="location.href='./joinForm.jsp'" class=""/>
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script type="text/javascript">
		var msg="${msg}";
		if(msg != ""){
			alert(msg);
		}
		
		
	</script>
</html>