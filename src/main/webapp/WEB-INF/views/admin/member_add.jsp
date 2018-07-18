<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../navigation/nav.jsp"/>
	
	<form action="member_add" method="POST">
		<label>
			Id : <input type="text" name="userid" id="userid">
			<button onclick="return check_id()">Check ID</button>
		</label>
	
		<label>
			Password : <input type="password" name="password" id="password">
		</label>
		
		<label>
			Password Confirm : <input type="password" name="password2" id="password2">
		</label>
		<label>
			Name : <input type="text" name="nickname" id="nickname">
		</label>
		<br>
		<input type="submit" value="Add Member" onclick="return memberAddConfirm()">
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