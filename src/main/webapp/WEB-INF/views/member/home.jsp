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
			<c:forEach var="m" items="${menu}">
				<tr>
					<td>
						<input type="checkbox" name="menu[]" value="${m.id}"">
					</td>
					<td>
						${m.mname}
					</td>
					<td>
						<input type="number" name="num[]" min="1" value="1">
					</td>
				</tr>
			</c:forEach>	
		</table>
		
		<input type="submit" value="Order" id="sendBtn"/>
	</form>

	

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sendBtn').click(function() {
				sendMessage();
			});
		});

		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");

		function sendMessage() {
			var arr = document.getElementsByName('menu[]');
			var arr_num = document.getElementsByName('num[]');
			var nickname = document.getElementById('nickname');
			var check=0;
			
			for (var i = 0; i < arr_num.length; i++) {
				if (arr[i].checked == true) {
					check++;
				}
			}
			if(check==0){
				alert('please check your order');
				return;
			}
			
			sock.send('okay');
		}
	</script>
</body>
</html>
