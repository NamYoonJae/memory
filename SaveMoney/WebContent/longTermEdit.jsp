<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	</head>
	<body>
	<jsp:include page="loginBox.jsp"></jsp:include>
	<form action="update" method="post" >
		
		<div id="a">
		<input type="hidden" name="idx" value="${dto.longIdx }"/>
		<input type="text" name="upsubject" value="${dto.longSubject}"/>
		
		<p>시작날짜 :
			<select name="upstartYear">
				<option value="${dto.syear}">${dto.syear}</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
			</select>
		
			<select name="upstartMonth">
				<option value="${dto.smonth}">${dto.smonth}</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			</p>
			
			
			<p>종료날짜 :
			<select name="upendYear">
				<option value="${dto.eyear}">${dto.eyear}</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
			</select>
		
			<select name="upendMonth">
				<option value="${dto.emonth}">${dto.emonth}</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			</p>
			
		<input type="text" name="upgoalMoney" value="${dto.longGoalM}"/>
		
		</br>
		</br>
		
		
		<input type="submit" value="확인"/>
		<input type="button" value="취소" onclick="aa()">
		</div>
		</form>
	</body>
	<script>
	function aa(){
		if (confirm("정말 취소하시겠습니다?")==true){
			location.href="longTermPlan.jsp";
		}else{
			return;
		}
	};
	</script>
</html>