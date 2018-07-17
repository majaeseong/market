<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>Login</title>
	<script src="<c:url value="/js/login_check.js" />"></script>
</head>
<body>
	<form method="POST" action="login">
	
		<label>
			Id : <input type="text" name="userid" id="userid">
		</label>
	
		<label>
			Password : <input type="password" name="password" id="password">
		</label>
		<br>
		<input type="submit" value="Login" onclick="return inputConfirm()">
	</form>
	
	<input type="hidden" value="${msg}" id="msg">
	
	<script type="text/javascript">
    	$(document).ready(function(){
    		var msg = $('#msg');
    		
    		if(msg.val() !=null && msg.val()!=""){
    			toastr.options = {
    					  "closeButton": true,
    					  "debug": false,
    					  "newestOnTop": false,
    					  "progressBar": false,
    					  "positionClass": "toast-bottom-center",
    					  "preventDuplicates": false,
    					  "onclick": null,
    					  "showDuration": "300",
    					  "hideDuration": "1000",
    					  "timeOut": "5000",
    					  "extendedTimeOut": "1000",
    					  "showEasing": "swing",
    					  "hideEasing": "linear",
    					  "showMethod": "fadeIn",
    					  "hideMethod": "fadeOut"
    					}
    				toastr["warning"](msg.val(), "LOGIN ERROR");
    		}
    	});
    </script>
</body>
</html>
