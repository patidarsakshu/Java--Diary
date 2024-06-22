package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Db.DBConnect;
import com.User.Post;
import com.DAO.PostDAO;


@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 int uid=Integer.parseInt(request.getParameter("uid"));
		 String title=request.getParameter("title");
		 String content=request.getParameter("content");
		 
		 PostDAO po=new PostDAO(DBConnect.getConn());
		boolean f= po.AddNotes(title, content, uid);
		 if(f)
		 {
			 System.out.println("add successfully");
			 response.sendRedirect("showNotes.jsp");
		 }
		 else
		 {
			 System.out.println("data not add");
		 }
	}

}
