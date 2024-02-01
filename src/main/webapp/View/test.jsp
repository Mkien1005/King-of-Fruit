<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=session.getAttribute("test1")%></h1>
	<form action="Test" method="POST">
		<input type = "submit" value="Login">
	</form>
</body>
</html>