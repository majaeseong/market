<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Kitchen List</title>
	<!-- Ajax & jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<!-- Web socket CDN -->
    <script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
</head>
<body>
	<div>
		<div>주방 주문 리스트</div>
		<div>
			<table id="myTable" class="table-bordered">
				<tr>
					<th>주문번호</th>
					<th>주문메뉴</th>
					<th>수량</th>
					<th>주문완료</th>
				</tr>
				<tbody></tbody>
			</table>
		</div>
	</div>
	
	<div>
		<div>국수 : <span id="noodle"></span> </div>
		<div>도토리묵 : <span id="dotori"></span> </div>
		<div>메밀묵 : <span id="memil"></span> </div>
		<div>비빔밥 : <span id="bibim"></span> </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			getOrderByFinished();
			
		});

		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		sock.onmessage = onMessage;

		function onMessage(evt) {
			if(evt.data==='list2_order'){
				setTimeout(function(){
					getOrderByFinished();
				},3000)
			}
		}
		
		function getOrderByFinished(){
			var url = "getOrderByKinds?kinds=1";
			
			var noodle = 0;
			var dotori = 0;
			var memil = 0;
			var bibim = 0;
			
			$.get(url, function(data,status){
					
					if(status!=='success'){
				 		return;
				 	}
					$("#myTable > tbody:last").empty();
					
					data.forEach(function(obj){
						$("#myTable > tbody:last").append(
							"<tr><td>" + obj.order_id + "</td>"+
							"<td>"+obj.mname+"</td>"+
							"<td>"+obj.quantity+"</td>"+
							"<td>"+"<button onclick='finish_order("+obj.id+")'>"+"Finished"+"</button>"+"</td>"+
							"</tr>"
						)
						if(obj.mname == "국수"){
							noodle+=obj.quantity;
						}else if(obj.mname == "도토리묵"){
							dotori+=obj.quantity;
						}else if(obj.mname == "메밀묵"){
							memil+=obj.quantity;
						}else if(obj.mname == "비빔밥"){
							bibim+=obj.quantity;
						}
				
				});
					
				$('#noodle').empty();
				$('#noodle').append(noodle);
				
				$('#dotori').empty();
				$('#dotori').append(dotori);
				
				$('#memil').empty();
				$('#memil').append(memil);
				
				$('#bibim').empty();
				$('#bibim').append(bibim);
					
			});
			
		}
		
		function finish_order(obj){
			var url = "finished?id="+obj+"&kinds=1";
			
			location.href=url;
		}
		
	</script>
	
</body>
</html>