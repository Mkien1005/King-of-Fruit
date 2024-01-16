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
</head>
<body class="img js-fullheight"
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
								<!-- <div class="form-group">
								<input type="text" class="form-control" name="name" placeholder="Username"
									required>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="name" placeholder="Username"
									required>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="name" placeholder="Username"
									required>
							</div>
							<div class="form-group">
								<input id="password-field" type="password" name="pass" class="form-control"
									placeholder="Password" required> <span
									toggle="#password-field"
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
									</div> -->
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
										class="form-control btn btn-primary submit px-3">Register</button>
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
	</script>
	<script src="../public/js/jquery.min.js"></script>
	<script src="../public/js/popper.js"></script>
	<script src="../public/js/bootstrap.min.js"></script>
	<script src="../public/js/main1.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>