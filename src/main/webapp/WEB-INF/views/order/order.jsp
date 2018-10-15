<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Order</title>
</head>

<body>

	<br>
	<fieldset>
		<legend>연탄구이 메뉴</legend>
		<table>
			<c:forEach items="${menu0}" var="m" >
				<tr>
				<td>
					${m.name}
				</td>
				<td>
					<input type="number" value="0" id="menu_${m.id}" name="menu_num">
				</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	
	<br><br>
	
	<fieldset>
		<legend>주방 메뉴</legend>
		<table>
			<c:forEach items="${menu1}" var="m" >
				<tr>
				<td>
					${m.name}
				</td>
				<td>
					<input type="number" value="0" id="menu_${m.id}" name="menu_num">
					<input type="hidden" value="0" id="last_num">
				</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	
	<br><br>
	<button onclick="order()">Order</button>
	
	<script>
		function order(){
			number_list =[];
			var last_num = document.getElementById("last_num").value;
			for(var i=1 ; i<=9 ; i++){
				
				var temp = "menu_"+i;
				var a = document.getElementById(temp).value;
				number_list[i-1]=a;
			}
			
			location.href="test?menu_num="+number_list;
			
		} 
	</script>
	
</body>
</html>
