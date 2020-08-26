<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SingleBook</title>
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
	select * from books where bookid=?
	<sql:param>${param.bookid}</sql:param>
</sql:query>

<div class="container">
<div class="row">
	<c:forEach items="${rs.rows}" var="row">
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<a href="Book.jsp?bookid=${row.bookid}"><img src="ImageServlet?id=${row.bookid}" class="col-lg-12"/></a>
		</div>
			
		<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<h3 class="col-lg-12">${row.bookname}</h3>
						<h5 class="col-lg-12">${row.author}</h5>
						<h5 class="col-lg-12">Rs. ${row.price}</h5>
						<a href="" class="btn btn-success btn-block">Add To Cart</a>
						
						<!-- If the book price is greater than 0 than buy button will be displayed. -->
						<c:if test="${row.price>0}">
						<a href="" class="btn btn-primary btn-block">Buy</a>
						</c:if>
						
						<!-- If books price is 0 than read button will be displayed for reading the book online. -->
						<c:if test="${row.price<=0}">
						<a href="${row.link}" target="_blank" class="btn btn-secondary btn-block">Read</a>
						</c:if>
						
						<a href="DeleteServlet?bookid=${row.bookid}" class="btn btn-danger btn-block">Delete</a>
						<a href="Edit.jsp?bookid=${row.bookid}" class="btn btn-warning btn-block">Edit</a>
		</div>	
		
		</c:forEach>
		

</div>
</div>
</body>
</html>