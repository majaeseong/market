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
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			$('#sendBtn').click(function() {
				sendMessage();
			});
			
		});
		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		function sendMessage() {

			sock.send('okay');
			return true;
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
		
	</script>
</body>
</html>