<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	 UserDetails user1=(UserDetails)session.getAttribute("userD");
	
	if(user1==null)
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","please Login..");
	}
	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>addNotes</title>
<%@include file="common/allcss.jsp"%>
</head>
<body>
<%@include file="common/navbar.jsp"%>
	<div class="container-fluid mt-5 mb-5">
		
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
			<div class="col-md-12">
				<form action ="AddNotesServlet" method="post">
					<div class="form-group">
					<%
					UserDetails us= (UserDetails) session.getAttribute("userD");
					if(us!=null)
					{%>
							<input type="hidden" value="<%=us.getId() %>" name="uid">
					<%}
					%>
				
					
						<label for="exampleInputEmail1">Enter Title</label>
						  <input type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="title" required="required"> 
					</div>
					
					<div class="form-group">
					<label for="exampleInputEmail1" >Enter content</label>
					<textarea rows="9" cols="" class ="form-control" name="content" required="required"></textarea>
					</div>
					<div class="container text-center" >
					 
					 <button type="submit" class="btn btn-primary">Add Notes</button> 
					 </div>
				</form>
			</div>
		</div>
		
		</div>

	</div>
	<br/><br/>
	<%@include file="common/footer.jsp" %>
</body>
</html>