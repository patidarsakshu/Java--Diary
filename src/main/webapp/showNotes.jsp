
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.Db.DBConnect"%>
<%@ page import="com.DAO.PostDAO"%>
<%@page import="com.User.Post"%>
<%@page import="java.util.*" %>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "please Login..");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show Notes</title>
<%@include file="common/allcss.jsp"%>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<%
	  String updatemsg=(String)session.getAttribute("updatemsg");
	  if(updatemsg!=null)
	  {%>
		  <div class="alert alert-success" role="alert"><%=updatemsg %></div>
	<%  
	session.removeAttribute("updatemsg");
	  }
	%>
	<%
	  String wrongmsg=(String)session.getAttribute("wrongmsg");
	  if(wrongmsg!=null)
	  {%>
		  <div class="alert alert-danger" role="alert"><%=wrongmsg %></div>
	<%  
	session.removeAttribute("wrongmsg");
	  }
	%>
	<div class="container mt-5">
		<div class="text-center">
			<h1>All Notes</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDAO ob = new PostDAO(DBConnect.getConn());
					List<Post> post = ob.getData(user3.getId());

					for (Post po : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="img/d1.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">

					<div class="card-body p-4">



						<h5 class="card-title"><%= po.getTitle() %></h5>

						<p><%= po.getContent() %>.</p>

						<p>
							<b class="text-success">Published By:<%= user3.getName() %> </b><br /> <b
								class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date: <%=po.getUdate() %></b><br /> <b
								class="text-success"></b>
						</p>

						<div class="container  text-center mt-12">
							<a href="deleteServlet?note_id=<%= po.getId() %>" class="btn btn-danger">Delete</a> 
							
							<a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary">Edit</a>

						</div>
					</div>
				</div>
				<%
				}
				}
				%>

			</div>
		</div>

	</div>
</body>
</html>