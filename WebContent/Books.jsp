<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<sql:setDataSource
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/demo"
	user="root"
	password="root"
	var="con"/>
	
<sql:query var="rs" dataSource="${con}">
	select * from books where status='A'
</sql:query>

<div class="container">
<div class="row">
	<c:forEach items="${rs.rows}" var="row">
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
		<a href="Book.jsp?bookid=${row.bookid}"><img src="ImageServlet?id=${row.bookid}" style="height:250px" class="col-lg-12"/></a>
		<h3 class="col-lg-12">${row.bookname}</h3>
		<h4 class="col-lg-12">Rs.${row.price}</h4>
		<a href="" class="btn btn-success btn-block">Add To Cart</a>
		<a href="" class="btn btn-danger btn-block">Buy</a>
		</div>
	</c:forEach>

</div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>