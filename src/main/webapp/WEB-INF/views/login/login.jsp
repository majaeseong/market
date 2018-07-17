<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>Login</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Toastr -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>
<body>
	<form method="POST" action="login">
	
		<label>
			Id : <input type="text" name="userid">
		</label>
	
		<label>
			Password : <input type="password" name="password">
		</label>
		<br>
		<input type="submit" value="Login">
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
    				toastr["warning"]("Login Error", msg.val());
    		}
    	});
    </script>
</body>
</html>
