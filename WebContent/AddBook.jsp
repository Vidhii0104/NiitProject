<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddBook</title>
<style>
	.myclass
	{
		margin:0 auto;
	}
</style>
</head>
<body>
		<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		
		<form action='AddBookServlet' method='post' enctype="multipart/form-data" class="myclass col-lg-6 col-md-9 col-sm-12 col-xs-12">
			<div class="form-group">
				<label>Enter Book Name</label>
				<input type="text" name="bookname" placeholder="Enter BookName" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Author</label>
				<input type="text" name="author" placeholder="Enter Author" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Add Genre</label>
				<input type="text" name="genre" placeholder="Enter Genre" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" placeholder="Enter Price" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Link</label>
				<input type="text" name="link" placeholder="Enter Link" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Selct Image</label>
				<input type="file" name="image" placeholder="Select Image" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Add Book" class="btn btn-success btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>