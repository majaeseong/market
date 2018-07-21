<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.js"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"/>
 	<script type="text/javascript">
	</script>
</head>
<body>
	<c:import url="../navigation/nav.jsp"/>
	
	<div class="member_order">
		<h3>Order</h3>
		<div class="order_box">
			<table id="myTable" class="table-bordered">
				<tr>
					<th>Who</th>
					<th>What</th>
					<th>How</th>
				</tr>
				<tbody></tbody>
			</table>
		</div>
		<button id="finishedBtn" class="btn btn-primary okay_btn">Okay</button>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			getOrderByFinished()
			
			$('#finishedBtn').click(function() {
				finished();
			});
			
		});

		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		sock.onmessage = onMessage;

		function onMessage(evt) {
			if(evt.data==='okay'){
				setTimeout(function(){
					getOrderByFinished();
				},3000)
			}
		}

		function finished() {
			document.getElementById("myTable").deleteRow('1');
			var url = "orderFinished";
			$.get(url, function(data,status){
				
				if(status!=='success'){
			 		return;
			 	}
				
			});
			
			sock.send('finish');
		}
		
		function getOrderByFinished(){
			var url = "getOrderByFinished";
			$.get(url, function(data,status){
					
					if(status!=='success'){
				 		return;
				 	}
					$("#myTable > tbody:last").empty();
					data.forEach(function(obj){
						$("#myTable > tbody:last").append(
							"<tr><td>" + obj.mname + "</td>"+
							"<td>"+obj.menu+"</td>"+
							"<td>"+obj.quantity+"</td>"+"</tr>"
						)
				});
					
			});
			
		}
			
			
			
	</script>

</body>
</html>