package com.Servlet;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;

import  javax.servlet.ServletException;
import  javax.servlet.annotation.WebServlet;
import  javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServlet;
import  javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	{
		String name=request.getParameter("uname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upass");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean f=dao.addUser(us);
		
		HttpSession session=request.getSession();
		if(f)
		{
			
			session.setAttribute("reg-sucess", "Registration Sucessfully......");
			response.sendRedirect("register.jsp");
		}
		else
		{
			session.setAttribute("failed-msg", "Something went wrong on server");
			response.sendRedirect("register.jsp");
		}
	}
}
