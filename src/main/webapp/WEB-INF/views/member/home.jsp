<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.js"/>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js" />
</head>
<script type="text/javascript"></script>
<body>
	<c:import url="../navigation/nav.jsp"/>
	<input type="hidden" value="${loginUser.nickname }" id="nickname">
	
		<div>
			<form action="home" method="POST">
				<table>
					<tr>
						<th>Check</th>
						<th>Menu Name</th>
						<th>Quantity</th>
					</tr>
					<c:forEach var="m" items="${menu}" varStatus="s">
						<tr>
							<td>
								<input type="checkbox" id="menu${s.index}" name="menu[]" value="${m.id}"
									onclick="checkCheck(this,${s.index})">
							</td>
							<td>
								${m.mname}
							</td>
							<td>
								<input type="number" id="num${s.index}" name="num[]" min="0" value="0" disabled>
							</td>
						</tr>
					</c:forEach>	
				</table>
				
				<input type="submit" value="Order" id="sendBtn" onClick="return count_check()"/>
			</form>
		</div>
		<div>
			<h3>My Order</h3>
			<table id="myTable">
				<tr>
					<th>Menu</th>
					<th>Quantity</th>
					<th>Time</th>
					<th>Del</th>
				</tr>
				<tbody></tbody>
			</table>
		</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			getMyOrder();
			
			$('#sendBtn').click(function() {
				sendMessage();
			});
		});
		
		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		sock.onmessage = onMessage;
		
		function sendMessage() {

			sock.send('okay');
			getMyOrder();
			return true;
		}
		
		function onMessage(evt) {
			if(evt.data==='finish'){
				
				setTimeout(function(){
					getMyOrder();
				},3000)
			}
			
		}
		
		function checkCheck(obj,num){
			if(obj.checked==true){
				var num_id = "num"+num;
				
				var o = document.getElementById(num_id);
				o.disabled=false;
				
			}else{
				var num_id = "num"+num;
				var o = document.getElementById(num_id);
				o.value=0;
				o.disabled=true;
			}
		}
		
		function count_check(){
			var arr = document.getElementsByName('menu[]');
			var arr_num = document.getElementsByName('num[]');
			var check=0;
			
			for (var i = 0; i < arr.length; i++) {
				if (arr[i].checked == true) {
					check++;
					if(arr_num[i].value==0) {
						alert('can not order by 0');
						return false;
					}
				}
			}
			
			if(check==0){
				alert('please check your order');
				return false;
			}
		}
		
		function del_order(obj){
			var url = "delOrderById?id="+obj;
			
			sock.send('okay');
			
			location.href=url;
		}
		

		function getMyOrder(){
			var url = "getMyOrder";
			$.get(url, function(data,status){
					
					if(status!=='success'){
				 		return;
				 	}
					$("#myTable > tbody:last").empty();
					data.forEach(function(obj){
						var d = new Date(obj.t);
						var hour = ((d.getHours()+15)<10)?"0"+(d.getHours()+15) : (d.getHours()+15);
						if(hour >24){
							hour= hour-24;
						}
						var min = (d.getMinutes()<10)?"0"+d.getMinutes() : d.getMinutes();
						$("#myTable > tbody:last").append(
							"<tr><td>" + obj.menu + "</td>"+
							"<td>"+obj.quantity+"</td>"+
							"<td>"+hour+" : "+min+"</td>"+
							"<td>"+"<button onclick='del_order("+obj.id+")'>"+"Del"+"</button>"+"</td>"+
							"</tr>"
						)
				});
					
			});
		}
	</script>
</body>
</html>