
function inputConfirm(){
	var id = document.getElementById('userid');
	var password = document.getElementById('password');
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
	
	if(id.value==null || id.value==""){
		toastr["warning"]("please input your id", "LOGIN ERROR");
		return false;
	}else if(password.value==null || password.value==""){
		toastr["warning"]("please input your password", "LOGIN ERROR");
		return false;
	}else{
		return true;
	}
}

function memberAddConfirm(){
	var id = document.getElementById('userid');
	var password = document.getElementById('password');
	var password2 = document.getElementById('password2');
	var nickname = document.getElementById('nickname');
	var check = document.getElementById('check');

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
	
	if(id.value==null || id.value==""){
		toastr["warning"]("please input your id", "ADD ERROR");
		return false;
	}else if(password.value==null || password.value==""){
		toastr["warning"]("please input your password", "ADD ERROR");
		return false;
	}else if(password2.value==null || password2.value==""){
		toastr["warning"]("please input your password confirm", "ADD ERROR");
		return false;
	}else if(password.value != password2.value){
		toastr["warning"]("please check your password and password confirm", "ADD ERROR");
		return false;
	}else if(nickname.value==null || nickname.value==""){
		toastr["warning"]("please input your name", "ADD ERROR");
		return false;
	}else if(check.value=="0"){
		toastr["warning"]("you must check your id on duplicate", "ADD ERROR");
		return false;
	}
	else{
		return true;
	}
}

function check_myPage(){
	
	var nickname = document.getElementById('nickname');
	
	var old_password = document.getElementById('old_password');
	var op = document.getElementById('op');
	
	var password = document.getElementById('password');
	var password2 = document.getElementById('password2');
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
	
	if(nickname.value==null || nickname.value==""){
		toastr["warning"]("please input your Nickname", "EDIT ERROR");
		return false;
	}else if(old_password.value==null || old_password.value==""){
		toastr["warning"]("please input your Now password", "EDIT ERROR");
		return false;
	}else if(old_password.value!=op.value){
		toastr["warning"]("please check your oldpassword", "EDIT ERROR");
		return false;
	}else if(password.value==null || password.value==""){
		toastr["warning"]("please input your new password", "EDIT ERROR");
		return false;
	}else if(password.value != password2.value){
		toastr["warning"]("please check your new password and confirm password", "EDIT ERROR");
		return false;
	}else{
		toastr["success"]("Okay", "EDIT SUCCESS");
		return true;
	}
}
