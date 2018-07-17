/**
 for login confirm 
 */
//Import script and css
document.write('<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>');
//Toastr
document.write('<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">');
document.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>');

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
