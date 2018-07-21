<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Navi</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="<c:url value="/js/check.js" />"></script>
<link href="<c:url value="/css/styles.css" />" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
</head>

<body>
	
		<c:if test="${loginUser!=null }">
			<div class="navi_menu">
				<div>
					<c:if test="${loginUser.auth==1 }">
						<a href="../admin/home">Admin Home</a>
					</c:if>
					<a href="../member/home">Home</a>
					<a href="../member/order">Order Page</a>
					<a href="../member/myPage">My Page</a>
				</div>
				<div class="text_menu">
					<span>${loginUser.nickname}님 어서오세요</span>
					<button onclick="location.href='../logout'" class="btn btn-default btn-sm">Logout</button>
				</div>
			</div>
		</c:if>
		<c:if test="${loginUser==null }">
			<div class="navi_menu">
				<div class="text_menu">LoginPage</div>
			</div>
		</c:if>
	
</body>
</html>