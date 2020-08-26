<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<style>
.myclass{
 margin:0 auto;
}

</style>
</head>
<body>

<%
	session.removeAttribute("un");
	session.invalidate();
%>
	
	<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<form action='LoginServlet' method='post' class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
	<div class="form-group">
		<label>Enter Username</label>
		<input type="text" name="username" placeholder="Enter Username" class="form-control">
	</div>
	<div class="form=group">
		<label>Enter Password</label>
		<input type="password" name="password" placeholder="Enter Password" class="form-control">
	</div>
	<div class="form=group">
		<input type="submit" value="Login" class="btn btn-success btn-block">
		<input type="reset"  value="Reset" class="btn btn-danger btn-block">
	</div>
	</form>
	
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>