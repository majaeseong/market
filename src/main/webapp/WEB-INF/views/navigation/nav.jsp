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
</head>

<body>
	<c:if test="${loginUser!=null }">
		<div>
			${loginUser.nickname}님 어서오세요 :)
		</div>
		<div>
			<a href="../logout">Logout</a>
		</div>
	</c:if>
	<c:if test="${loginUser==null }">
		go to login
	</c:if>
</body>
</html>