<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MainPage</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script  src="js/bootstrap.js"></script>
		<style type="text/css">
			div{
				border: 1px solid black;
			}
			
			#MainStat{
				top : 15%;
				position : absolute;
				width : 300px;
				height : 310px;
				
				padding : 5px 10px;
			}
			#MainCal{
				top : 50%;
				position: absolute;
				width : 300px;
				height : 310px;
				
				padding : 5px 10px;
			}
			#MainImg{
				top : 15%;
				left : 340px;
				width : 50%;
				height : 70%;
				
				position: absolute;
				
			}
			#MainLong{
				top : 15%;
				right: 10%;
				width : 10%;
				height : 70%;
				
				position: absolute;
			}
		</style>
	</head>
	<body>
		<jsp:include page="loginBox.jsp"></jsp:include>
		<div id="Main">
			<div id="MainStat">통계자료</div>
			<div id="MainCal">지출,수입내역</div>
			<div id="MainImg">Image Area</div>
			<div id="MainLong">장기계획</div>
		
		</div>
	</body>
</html>