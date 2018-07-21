<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
</head>
<body>
	<c:import url="../navigation/nav.jsp"/>
	<main>
		<form action="myPage" method="POST">
			<input type="hidden" value="${mem.id }" name="id">
			<label>
				Id : 
				<input type="text" name="userid" id="userid" value="${mem.userid}" disabled>
			</label>
			<label>
				NickName : 
				<input type="text" name="nickname" id="nickname" value="${mem.nickname }">
			</label>
			<label>
				Now Password : 
				<input type="password" name="old_password" id="old_password">
				<input type="hidden" name="op" value="${mem.password }" id="op">
			</label>
			<label>
				New Password : 
				<input type="password" name="password" id="password">
			</label>
			<label>
				Confirm Password : 
				<input type="password" name="password2" id="password2">
			</label>
			<input type="submit" value="Edit" onclick="return check_myPage()">
		</form>
	</main>

</body>
</html>