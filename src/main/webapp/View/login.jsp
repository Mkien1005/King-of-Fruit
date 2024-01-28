<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="vi">
<head>
<title>Log in - King of Fruit</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet" href="../public/css1/style.css">
<link rel="icon" type="image/x-icon" href="../public/img/icon.png">
</head>
<body class="img js-fullheight"
	style="background-image: url(../public/img/bg.jpg);">
	<form method="post">
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center"></div>
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-4">
						<div class="login-wrap p-0">
							<h3 class="mb-4 text-center">Have an account?</h3>
							<form action="#" class="signin-form">
								<div class="form-group">
									<input type="text" class="form-control" id="username"
										name="name" placeholder="Username" required>
								</div>
								<div class="form-group">
									<input id="password-field" type="password" name="pass"
										class="form-control" placeholder="Password" required>
									<span toggle="#password-field"
										class="fa fa-fw fa-eye field-icon toggle-password"></span>
								</div>
								<div class="form-group">
									<button type="submit" id="button-login"
										class="form-control btn btn-primary submit px-3">Sign
										In</button>
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
							<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
							<div class="social d-flex text-center">
								<a href="#" class="px-2 py-2 mr-md-1 rounded"><span
									class="ion-logo-facebook mr-2"></span> Facebook</a> <a href="#"
									class="px-2 py-2 ml-md-1 rounded"><span
									class="ion-logo-twitter mr-2"></span> Twitter</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
	</form>
	<div aria-live="polite" aria-atomic="true"
		style="position: relative; min-height: 200px;">
		<div class="toast" style="position: absolute; top: 0; right: 0;">
			<div class="toast-header">
				<img src="..." class="rounded mr-2" alt="..."> <strong
					class="mr-auto">Hệ thống!</strong> <small>Just now</small>
				<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body">
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
	<script src="../public/js/jquery.min.js"></script>
	<script src="../public/js/popper.js"></script>
	<script src="../public/js/bootstrap.min.js"></script>
	<script src="../public/js/main1.js"></script>
	<script>
		let btn = document.querySelector("#button-login");
		console.log(btn)
		btn.addEventListener("click",(e)=> {
			e.preventDefault()
			var username = document.querySelector("#username").value;
			var password = document.querySelector("#password-field").value;
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "../controller/Login", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					var response = xhr.responseText;
					if (response === "success") {
						showBootstrapToast("Đăng nhập thành công!");
						// Đăng nhập thành công, chuyển hướng hoặc thực hiện hành động khác
						setTimeout(function() {
		                    window.location.href = "../getProduct";
		                }, 2000);					
						} else {
						// Đăng nhập không thành công, hiển thị thông báo lỗi
						showBootstrapToast("Tên đăng nhập hoặc mật khẩu không đúng!");
					}
				}
			};
			xhr.send("username=" + encodeURIComponent(username) + "&password="
					+ encodeURIComponent(password));
		})

		function showBootstrapToast(message) {
			// Sử dụng toast message của Bootstrap
			$('.toast').toast({
				autohide : false
			});
			$('.toast-body').text(message);
			$('.toast').toast('show');
		}
	</script>
</body>
</html>