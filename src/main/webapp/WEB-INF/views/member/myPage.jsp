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
			<div class="myPage">
				<table id="myTable" class="table-hover">
					<tr>
						<td>ID</td>
						<td>
							<input type="text" name="userid" id="userid" value="${mem.userid}" disabled="disabled">
						</td>
					</tr>
					<tr>
						<td>NickName</td>
						<td>
							<input type="text" name="nickname" id="nickname" value="${mem.nickname }">
						</td>
					</tr>
					<tr>
						<td>Now Password</td>
						<td>
							<input type="password" name="old_password" id="old_password">
							<input type="hidden" name="op" value="${mem.password }" id="op">
						</td>
					</tr>
					<tr>
						<td>New Password</td>
						<td>
							<input type="password" name="password" id="password">
						</td>
					</tr>
					<tr>
						<td>Confirm Password</td>
						<td>
							<input type="password" name="password2" id="password2">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right">
							<input type="submit" value="Edit" onclick="return check_myPage()"
								class="btn btn-success">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</main>

</body>
</html>