import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="RegisterServlet",urlPatterns="/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
{
	String username=req.getParameter("username");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
		PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?)");
		ps.setString(1,username);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.executeUpdate();
		
		resp.sendRedirect("Home.jsp");
		
	}catch (Exception e)
	{
		System.out.println(e);
	}
	
}
}
