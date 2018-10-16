<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Gui List</title>
	<!-- Ajax & jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<!-- Web socket CDN -->
    <script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
</head>
<body>
	<div>
		<div>연탄구이 주문 리스트</div>
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
		<div>닭발 : <span id="foot"></span> </div>
		<div>목살 : <span id="neck"></span> </div>
		<div>발+목 : <span id="foot_neck"></span> </div>
		<div>똥집 : <span id="ddongjip"></span> </div>
		<div>석쇠구이 : <span id="sucksoi"></span> </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			getOrderByFinished();
			
		});

		var sock = new WebSocket("ws://localhost:8080/market/echo/websocket");
		sock.onmessage = onMessage;

		function onMessage(evt) {
			if(evt.data==='list1_order'){
				setTimeout(function(){
					getOrderByFinished();
				},3000)
			}
		}
		
		function getOrderByFinished(){
			var url = "getOrderByKinds?kinds=0";
			
			var foot = 0;
			var neck = 0;
			var foot_neck = 0;
			var ddongjip = 0;
			var sucksoi = 0;
			
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
						if(obj.mname == "돼지석쇠구이"){
							sucksoi+=obj.quantity;
						}else if(obj.mname == "똥집"){
							ddongjip+=obj.quantity;
						}else if(obj.mname == "목+발"){
							foot_neck+=obj.quantity;
						}else if(obj.mname == "목살"){
							neck+=obj.quantity;
						}else if(obj.mname == "닭발"){
							foot+=obj.quantity;
						}
				
				});
					
				$('#foot').empty();
				$('#foot').append(foot);
				
				$('#neck').empty();
				$('#neck').append(neck);
				
				$('#foot_neck').empty();
				$('#foot_neck').append(foot_neck);
				
				$('#ddongjip').empty();
				$('#ddongjip').append(ddongjip);
				
				$('#sucksoi').empty();
				$('#sucksoi').append(sucksoi);
					
			});
			
		}
		
		function finish_order(obj){
			var url = "finished?id="+obj+"&kinds=0";
			
			location.href=url;
		}
		
	</script>
	
</body>
</html>