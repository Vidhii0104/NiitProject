import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookid=Integer.parseInt(req.getParameter("bookid"));
		String bookName= req.getParameter("bookname");
		String author= req.getParameter("author");
		String genre=req.getParameter("genre");
		String link= req.getParameter("link");
		Float price=Float.parseFloat(req.getParameter("price"));
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
			PreparedStatement ps=con.prepareStatement("update books set bookname=?,author=?,genre=?,price=?,link=? where bookid=?");
			ps.setString(1, bookName);
			ps.setString(2, author);
			ps.setString(3, genre);
			ps.setFloat(4, price);
			ps.setString(5, link);
			ps.setInt(6, bookid);
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
