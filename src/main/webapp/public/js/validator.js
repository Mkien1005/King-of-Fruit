let direct = document.querySelector(".redirect-signin");
direct.addEventListener("click",()=>{
	window.location.href="loginPage"
})
let btn = document.querySelector("#register");
		btn.addEventListener("click",(e)=> {
			e.preventDefault()
			var fullname = document.querySelector("#fullname").value;
			var username = document.querySelector("#username").value;
			var password = document.querySelector("#password").value;
			var password_cf = document.querySelector("#password_confirmation").value;
			var phone = document.querySelector("#phone").value;
			var email = document.querySelector("#email").value;
			if(fullname == '' || username =='' || password.length =='' || phone =='' || email =='' || password_cf.length ==''){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Please complete all fields to proceed.",
					});
				return;
			}
			if(fullname.length>50){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Maximum length for fullname is 50 characters!",
					});
				return
			}
			if(username.length>30){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Maximum length for username is 30 characters!",
					});
				return
			}
			var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var check_regex = /[!@#$%^&*(),.?":{}|<>]/
			
			if(!mail.test(email)){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Please enter a valid email address in this field!",
					});
				return
			}
			if(isNaN(phone)){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "A valid phone number is required for this field!",
					});
				return
			}
			function isValidPhoneNumber(phoneNumber) {
				// Biểu thức chính quy để so khớp với số điện thoại của Việt Nam
				var regex = /^(0|\+84)\d{9,10}$/;
				return regex.test(phoneNumber);
			}
			if(!isValidPhoneNumber(phone)){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Please enter a valid phone number!",
					});
				return
			}
			if(phone.length >15){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Maximum length for phone number is 15!",
					});
				return
			}
			if(password.length<8){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Minimum length for password is 8!"
					});
				return
			}
			if(!check_regex.test(password)){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Please use at least one special character in your password!"
					});
				return
			}
			if(password_cf != password){
				Swal.fire({
					  icon: "error",
					  title: "Oops...",
					  text: "Passwords do not match!",
					});
				return
			}
			
			$.ajax({
	            url: "Register", // Đường dẫn tới tập tin xử lý trên máy chủ
	            method: "POST", // Phương thức yêu cầu
	            data: {
					fullname: fullname,
					username: username,
					password: password,
					phone: phone,
					email: email
				},
	            success: function(response){ // Hàm được gọi khi yêu cầu thành công
	                // Hiển thị phản hồi từ máy chủ trong một phần tử HTML
	                if(response == "Username" || response == "Email"){
	                	Swal.fire({					
								icon: "error",
								title: response + " was registed!",
								showConfirmButton: false,
								timer: 1500
						});
	                }else{
	                	Swal.fire({
							  position: "center-center",
							  icon: "success",
							  title: "Success!",
							  text: "Register success"
							});
	                	setTimeout(function() {
		                    window.location.href = "indexForward";
		                }, 2000);
	                }
	            },
	            error: function(xhr, status, error){ // Hàm được gọi khi có lỗi xảy ra
	                // Hiển thị thông báo lỗi
	                $("#result").html("Error: " + xhr.status + " " + xhr.statusText);
	            }
	        }) 
		})