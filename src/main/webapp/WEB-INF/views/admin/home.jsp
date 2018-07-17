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
			<c:forEach items="${admin_list}" var="l">
				<div>
					<c:if test="${menu_num==0}">
						${l.id } / ${l.userid } / ${l.password } / ${l.nickname } / ${l.auth }
					</c:if>
					<c:if test="${menu_num==1}">
						${l.id } / ${l.mname } / ${l.price } / ${l.todaysold }
					</c:if>
				</div>
			</c:forEach>
		</div>
	</main>
</body>
</html>