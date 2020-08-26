import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//

@WebServlet(name="AddBookServlet",urlPatterns="/AddBookServlet")
@MultipartConfig(maxFileSize=9999999999L)
public class AddBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String bookname=req.getParameter("bookname");
	String author=req.getParameter("author");
	String genre=req.getParameter("genre");
	float price=Float.parseFloat(req.getParameter("price"));
	String link=req.getParameter("link");
	
	Part part=req.getPart("image");
	InputStream is=part.getInputStream();
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
		PreparedStatement ps=con.prepareStatement("insert into books (bookname,author,genre,price,link,image,status) values(?,?,?,?,?,?,?)");
		ps.setString(1, bookname);
		ps.setString(2, author);
		ps.setString(3, genre);
		ps.setFloat(4, price);
		ps.setString(5, link);
		ps.setBlob(6,is);
		ps.setString(7, "A");
		ps.executeUpdate();
		resp.sendRedirect("Books.jsp");
	}
	catch(Exception e)
	{
		PrintWriter out=resp.getWriter();
		out.println(e);
	}
	}
}
