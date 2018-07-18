<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${menu_num}">
	<c:import url="../navigation/nav.jsp"/>
	<main class="admin_home">
		<div class="left_menu">
			<a href="home?menu_num=0">Member Add / Edit</a>
			<br>
			<a href="home?menu_num=1">Menu Add / Edit</a>
		</div>
		<div class="right_main">
			<c:if test="${menu_num==0}">
				<button onclick="location.href='member_add'">Add Member</button>
			</c:if> 
			<c:if test="${menu_num==1}">
				<button onclick="location.href='edit_menu?id=0'">Add Menu</button>
			</c:if>
			
			<table>
				<thead>
					<tr>
						<c:if test="${menu_num==0}">
							<th>ID</th>
							<th>User ID</th>
							<th>User Name</th>
							<th>Auth</th>
							<th>Delete</th>
						</c:if>
						<c:if test="${menu_num==1}">
							<th>ID</th>
							<th>Menu Name</th>
							<th>Price</th>
							<th>Today's sold</th>
							<th>Edit Menu</th>
							<th>Delete</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${admin_list}" var="l">	
						<tr>
							<c:if test="${menu_num==0}">
								<td>${l.id }</td>
								<td>${l.userid }</td>
								<td>${l.nickname }</td>
								<td>${l.auth }</td>
								<td><button onclick="return confirm_del(0,${l.id})">DELETE</button></td>
							</c:if>
							<c:if test="${menu_num==1}">
								<td>${l.id }</td>
								<td>${l.mname }</td>
								<td>${l.price }</td>
								<td>${l.todaysold }</td>
								<td><button onclick="location.href='edit_menu=1?id=${l.id}'">Edit</button></td>
								<td><button onclick="return confirm_del(1,${l.id })">DELETE</button></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	
	<script type="text/javascript">
		function confirm_del(menu_num,id){
			if (confirm("R U sure?") == true){
				location.href='delete?menu_num='+menu_num+'&id='+id;
			  }else{
			      return false;
			  }
		}
	</script>
</body>
</html>