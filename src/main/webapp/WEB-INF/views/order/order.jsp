<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Order</title>
	<!-- Ajax & jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<!-- Web socket CDN -->
    <script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
	<link href="<c:url value="/css/styles.css" />" rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
	
	<br>
	<div class="order">
		<fieldset>
			<legend class="order_title">연탄구이 메뉴</legend>
			<table class="order_table">
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
			<legend class="order_title">주방 메뉴</legend>
			<table  class="order_table">
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
		<button onclick="return order()" id="sendBtn" class="btn btn-info btn-width">Order</button>
		
		
		<input type="hidden" value="${order_id}" id="order_id">
	</div>
	
	
	<script>
		$(document).ready(function(){
			
			//Order Success
			var id = document.getElementById('order_id').value;
			if(id !=0)
				alert("your order number is "+id);
			
			//Order Button (WebSocket)
			$("#sendBtn").click(function() {
               sendMessage();
             });
			
		});
		
		var sock = new WebSocket("ws://192.168.0.13:8080/market/echo/websocket");
		
		function sendMessage(){
			list1_count=0;
			list2_count=0;
			
			for(var i=1; i<=5;i++){
				var temp= "menu_"+i;
				var a = document.getElementById(temp).value;
				if(a!=0){
					list1_count++;
				}
			}
			
			for(var i=6; i<=9;i++){
				var temp= "menu_"+i;
				var a = document.getElementById(temp).value;
				if(a!=0){
					list2_count++;
				}
			}
			if(list1_count!=0){
				sock.send('list1_order');
			}
			if(list2_count!=0){
				sock.send('list2_order');
			}
			
		}
		
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
