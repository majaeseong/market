<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
</head>
<body>
	<c:import url="../navigation/nav.jsp"/>
	<main>
		<form action ="edit_menu" method="POST">
			
				<!-- ADD -->
			<c:if test="${id==0}">
				<input type="hidden" value="0" name="id">
				<label>
					Menu Name :
					<input type="text" name="mname">
				</label>
				<label>
					Menu Price :
					<input type="number" name="price">
				</label>
				<input type="submit" value="Add">
			</c:if>
			
				<!-- Edit -->
			<c:if test="${id!=0}">
				<input type="hidden" value="${menu.id }" name="id">
				<label>
					Menu Name :
					<input type="text" name="mname"
						value="${menu.mname}">
				</label>
				<label>
					Menu Price :
					<input type="number" name="price"
						value="${menu.price }">
				</label>
				<input type="submit" value="Edit">
			</c:if>
			
		</form>
	
	</main>
</body>
</html>