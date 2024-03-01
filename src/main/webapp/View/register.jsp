<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="vi">
<head>
<title>Register - King of Fruit</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="../public/css1/style.css">
<link rel="icon" type="image/x-icon" href="../public/img/icon.png">
<style>
.form-group.invalid .form-control {
	border-color: yellow;
}

.form-group.invalid .form-message {
	color: yellow;
}
</style>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="img js-fullheight"
	style="background-image: url(../public/img/bg.jpg); overflow-y: hidden">
	<form id="form-1" action="../Register" method="post">
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center"></div>
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-4">
						<div class="login-wrap p-0">
							<h3 class="mb-4 text-center">Have an account?</h3>
							<form action="#" class="signin-form">
								<div class="form-group">
									<input id="fullname" name="fullname" type="text"
										placeholder="Full name" class="form-control" /> <span
										class="form-message"></span>
								</div>
								<div class="form-group">
									<input id="username" name="username" type="text"
										placeholder="username" class="form-control" /> <span
										class="form-message"></span>
								</div>
								<div class="form-group">
									<input id="email" name="email" type="text"
										placeholder="email@domain.com" class="form-control" />
									<span class="form-message"></span>
								</div>

								<div class="form-group">
									<input id="phone" name="phone" type="text"
										placeholder="Phone number" class="form-control" />
									<span class="form-message"></span>
								</div>

								<div class="form-group">
									<input id="password" name="password" placeholder="Password"
										type="password" class="form-control" /> <span
										class="form-message"></span>
								</div>
								<div class="form-group">
									<input id="password_confirmation" name="password_confirmation"
										placeholder="Retype password" type="password"
										class="form-control" /> <span class="form-message"></span>
								</div>
								<div class="form-group">
									<button type="submit"
										class="form-control btn btn-primary submit px-3" id="register">Register</button>
								</div>
								<div class="form-group d-md-flex">
									<div class="w-50">
										<label class="checkbox-wrap checkbox-primary">Remember
											Me <input type="checkbox" checked> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right">
										<a href="#" style="color: #fff">Forgot Password</a>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	</div>
	<script src="../public/js/validator.js"></script>
	<script>
		Validation({
			form : "#form-1",
			errorSelector : ".form-message",
			rules : [
					Validation.isRequired("#fullname"),
					Validation.isRequired("#username"),
					Validation.isRequired("#phone"),
					Validation.isEmail("#email"),
					Validation.minLength("#password", 6),
					Validation
							.isConfirmed(
									"#password_confirmation",
									function() {
										return document
												.querySelector("#password").value;
									}), ],
		});
		let btn = document.querySelector("#register");
		btn.addEventListener("click",(e)=> {
			e.preventDefault()
			var fullname = document.querySelector("#fullname").value;
			var username = document.querySelector("#username").value;
			var password = document.querySelector("#password").value;
			var phone = document.querySelector("#phone").value;
			var email = document.querySelector("#email").value;
			if(fullname == '' || username =='' || password =='' || phone =='' ||email ==''){
				return;
			}
			let user = {
					fullname: fullname,
					username: username,
					password: password,
					phone: phone,
					email: email
			}
			console.log(user)
			$.ajax({
	            url: "/re-java-web/Register", // Đường dẫn tới tập tin xử lý trên máy chủ
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
		                    window.location.href = "../indexForward";
		                }, 2000);
	                }
	            },
	            error: function(xhr, status, error){ // Hàm được gọi khi có lỗi xảy ra
	                // Hiển thị thông báo lỗi
	                $("#result").html("Error: " + xhr.status + " " + xhr.statusText);
	            }
	        }) 
		})
	</script>
	<script src="../public/js/jquery.min.js"></script>
	<script src="../public/js/popper.js"></script>
	<script src="../public/js/bootstrap.min.js"></script>
	<script src="../public/js/main1.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>