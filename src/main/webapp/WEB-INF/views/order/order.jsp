<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Order</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
					<input type="number" value="0" id="menu_${m.id}"
						 name="menu_num" min="0">
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
					<input type="number" value="0" id="menu_${m.id}"
						 name="menu_num" min="0">
				</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	
	<br><br>
	<button onclick="return order()">Order</button>
	
	
	<input type="hidden" value="${order_id}" id="order_id">
	
	
	
	<script>
		$(document).ready(function(){
			
			var id = document.getElementById('order_id').value;
			if(id !=0)
				alert("your order number is "+id);
		});
		
		function order(){
			
			var count=0;
			number_list =[];

			for(var i=1 ; i<=9 ; i++){	
				var temp = "menu_"+i;
				var a = document.getElementById(temp).value;
				number_list[i-1]=a;
				if(a!=0){
					count++;
				}
			}
			
			if(count==0){
				alert("you must check your order");
				return false;
			}else{
				location.href="add_order?menu_num="+number_list;
				return true;
			}
			
			
		} 
	</script>
	
</body>
</html>
