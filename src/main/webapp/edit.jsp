<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page  import="java.sql.Connection" %>
<%@ page  import="com.Db.DBConnect" %>
<%@page import="com.DAO.*" %>
<%@page import="com.User.Post" %>
<%@page import="com.Servlet.*" %>
    <%
	 UserDetails user4=(UserDetails)session.getAttribute("userD");
	
	if(user4==null)
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","please Login..");
	}
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="common/allcss.jsp"%>
</head>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDAO post = new PostDAO(DBConnect.getConn());
	Post p1 = post.getDataById(noteid);
	%>
	
	<div class="container-fluid ">
		<%@include file="common/navbar.jsp"%>
		<br/><br/>
		<h1 class="text-center ">Edit Your Notes</h1>
		<div class="container mb-5">
			<div class="row">
			<div class="col-md-12">
				<form action ="NoteEditServlet" method="post">
				<input type="hidden" value="<%=noteid%>" name="noteid">
						<div class="form-group">



							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%= p1.getTitle() %>"
								 />
						</div>

						<div class="form-group">
					<label for="exampleInputEmail1" >Enter the description about Your Title</label>
					<textarea rows="11" cols="" class ="form-control" name="content" required="required" ><%= p1.getContent() %></textarea>
					</div>
					<div class="container text-center" >
					 
					 <button type="submit" class="btn btn-primary">Add Notes</button> 
					 </div>
				</form>
			</div>
		</div>
		
		</div>

	</div>
	<%@include file="common/footer.jsp" %>
</body>
</html>