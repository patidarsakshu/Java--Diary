package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
      
		 Integer noteid=Integer.parseInt(request.getParameter("note_id"));
		 PostDAO dao=new PostDAO(DBConnect.getConn());
		 HttpSession sesson=null;
		 boolean f=dao.DeleteNotes(noteid);
		 if(f)
		 {
			 sesson=request.getSession();
			 sesson.setAttribute("updatemsg", "Notes Deleted Sucessfully");
			 response.sendRedirect("showNotes.jsp");
		 }
		 else
		 {
			 sesson=request.getSession();
			 sesson.setAttribute("wrongmsg", "Something went Wrong");
			 response.sendRedirect("showNotes.jsp");
		 }
	}

}
