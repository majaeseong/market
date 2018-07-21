<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Login</title>
</head>

<body>
	<c:import url="../navigation/nav.jsp"/>
	<form method="POST" action="login">
	
		<table class="login_table">
			<tr>
				<td>
					ID
				</td>
				<td>
					<input type="text" name="userid" id="userid">
				</td>
			</tr>
			<tr>
				<td>
					PASSWORD
				</td>
				<td>
					<input type="password" name="password" id="password">
				</td>
				<td rowspan="2" >
					<input type="submit" value="Login" onclick="return inputConfirm()" 
						class="btn btn-info btn-sm">
				</td>
			</tr>
		</table>
		
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
