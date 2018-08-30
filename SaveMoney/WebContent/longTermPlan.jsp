<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			progress{
				background-color: gray;
				border:0;
				height:50px;
				width : 700px;
				border-radius:90px;
			}
			
			
		</style>
	</head>
	<body>
	<jsp:include page="loginBox.jsp"></jsp:include>
	<form action="./updateForm" method="get">
	<div>
		<div id="listTable">	
			<span>
			</span>
			<!-- add -->		
		</div>
	</div>
	</form>
	</body>
	<script>
	$(document).ready(function(){
		$.ajax({
			type:"post",
			url:"./longlist",
			dataType:"json",
			success:function(data){
				console.log(data.list);
				if(data.list.length==0){
					if (confirm("장기계획이 없습니다. 추가하시겠습니까?")==true){
						location.href="longTermAdd.jsp";
					}else{
						/* location.href="main.jsp"; */
					}
				}
				console.log(data);
				
				listPrint(data.list);
				
			},
			error:function(error){
				console.log(error);
			}
		});
		
	});
	
	function listPrint(list){
		console.log(list);
		var content="";

		list.forEach(function(item,index){
			content+="<div>";
			content+="<span>";
				content+="<div>";
					content+="<progress value='"+item.longStackM+"'max='"+item.longGoalM+"'>";
					content+="</progress>";
					content+="<input name='idx' type='radio' value='"+item.longIdx+"'/>";
				content+="</div>";
				content+="<div>";
					content+="<table>";
					content+="<tr>";
					
						content+="<td>"+item.longSubject+"&nbsp&nbsp&nbsp</td>";
						content+="<td>"+item.longTerm+"일&nbsp&nbsp&nbsp</td>";
						/* content+="<td>"+item.longStackM+"</td>";
						content+="<td>"+item.longGoalM+"</td>"; */
						content+="<td>"+(item.longGoalM-item.longStackM)+"</td>";
					content+="</tr>";
					content+="</table>";
				content+="</div>";
				content+="<br/>";
			content+="</span>";
			content+="</div>";
			
			
			
		});
		$("#listTable").append(content);
		
		list.forEach(function(it,index){
			content="<input type='button' value='추가' onclick='add()'/>";
			/* content+="<input type='button' value='수정' onclick='update()'/>"; */
			content+="<input type='submit' value='수정'/>";
			content+="<input type='button' onclick='del()' value='삭제'/>";
		});
		$("#listTable").after(content);
		
		
	}

	
	function add(){
		location.href="longTermAdd.jsp";
	}
	
	/* function update(){		
		location.href="longTermEdit.jsp";
		
	} */
	
	
	
	function del(){
		var list = $("input[type='radio']");
		var val = "";
		
		if (confirm("삭제하시겠습니다?")==true){
			console.log($("input[type='radio']"));
			console.log(list.length);
			console.log(list[0].checked);
			for(var i=0;i<list.length;i++){
				if(list[i].checked == true){
					console.log(list[i].attributes[2].value);
					val = list[i].attributes[2].value
				}
			}
			location.href="./del?idx="+val;
		}else{
			return;
		}
	}
	
	
	
	
	</script>
</html>