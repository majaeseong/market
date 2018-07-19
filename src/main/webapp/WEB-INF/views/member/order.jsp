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
	<table id="myTable">
		<tr>
			<th>Order</th>
		</tr>
		<tbody></tbody>
	</table>

	<div id="data"></div>

	<button id="finishedBtn">Okay</button>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#finishedBtn').click(function() {
				finished();
			});
		});

		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		sock.onmessage = onMessage;

		function sendMessage() {
			sock.send($("#message").val());
		}

		function onMessage(evt) {
			var data = evt.data;
			$("#myTable > tbody:last").append("<tr><td>" + data + "</td></tr>");
		}

		function finished() {
			document.getElementById("myTable").deleteRow('1');
		}
	</script>

</body>
</html>