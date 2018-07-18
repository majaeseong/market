/**
 for login confirm 
 */
//Import script and css

//document.write('<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>');
////Toastr
//document.write('<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">');
//document.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>');

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
