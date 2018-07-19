<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	<input type="checkbox" id="foot" name="menu[]" value="foot">닭발
	<input tpye="number" id="foot_num" name="num[]" min="1"></br>
	
	<input type="checkbox" id="neck" name="menu[]" value="neck">목살
	<input tpye="number" id="neck_num" name="num[]" min="1"></br>
	
	<input type="checkbox" id="shit" name="menu[]" value="shit">똥집
	<input tpye="number" id="shit_num" name="num[]" min="1"></br>
	
	<input type="checkbox" id="pig" name="menu[]" value="pig">석쇠구이
	<input tpye="number" id="pig_m[]" name="num[]" min="1"></br>

	<input type="text" id="message">
	<button id="sendBtn">send message</button>

	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sendBtn').click(function() {
				sendMessage();
			});
		});

		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		//sock.onmessage = onMessage;

		function sendMessage() {
			var arr = document.getElementsByName('menu[]');
			var arr_num = document.getElementsByName('num[]');

			for (var i = 0; i < arr_num.length; i++) {
				if (arr[i].checked == true) {
					sock.send(arr[i].value + " " + arr_num[i].value);
				}
			}

		}

		/* function onMessage(evt) {
			var data = evt.data;
			$("#data").append(data + "<br/>");
		} */
	</script>
</body>
</html>
