<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Add Page</title>
</head>
<body>
	<c:import url="../navigation/nav.jsp"/>
	
	<form action="member_add" method="POST">
		<table class="table">
			<tr>
				<td>ID</td>
				<td>
					 <input type="text" name="userid" id="userid">
				</td>
				<td>
					<button onclick="return check_id()" class="btn btn-info">Check ID</button>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td colspan="2">
					<input type="password" name="password" id="password">
				</td>
			</tr>
			<tr>
				<td>Password Confirm</td>
				<td colspan="2">
					<input type="password" name="password2" id="password2">
				</td>
			</tr>
			<tr>
				<td>
					Name
				</td>
				<td colspan="2">
					<input type="text" name="nickname" id="nickname">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="Add Member" onclick="return memberAddConfirm()"
						class="btn btn-primary">
				</td>
			</tr>
		</table>
	</form>
	<input type="hidden" id="check" value="0">
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	var check = document.getElementById('check');
	
	function check_id(){
		
		var id = document.getElementById('userid').value;
		var id_url="id_check?userid="+id;
		
		if(id==null || id==""){
			alert('input your id');
			return false;
		}else if(id.length<4){
			alert('please id length is more than 4');
			return false;
		}else{
			$.get(id_url, function(data,status){
				
				if(status!=='success'){
			 		return;
			 	}
				
				if(data!=1){
					alert('this id already exist');
				}else{
					alert('you can use id');
					check.value='1';
				}
			});
			return false;
		}
		
	}
	
	</script>
	
</body>
</html>