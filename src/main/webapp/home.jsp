<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	 UserDetails user2=(UserDetails)session.getAttribute("userD");
	
	if(user2==null)
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","please Login..");
	}
	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<%@include file="common/allcss.jsp" %>
<style type="text/css">
.back-img{
background: url("img/d1.jpg");
width: 50%;
height: 110vh;
background-repeat: no-repeat;
background-size: cover;
}
</style>
</head>
<body>
<%@include file="common/navbar.jsp" %>

<div class="container-fluid mt-4 mb-5">
	<div class="card py-3">
	<div class="card-body text-center">
		<img alt="" src="img/d1.jpg" class="img-fluid mx-auto" style="max-width:300px;">
		<br/><br/>
		 <h1>ADD NOTES</h1>
		 <a href="addNotes.jsp" class="btn btn-outline-primary">start here</a>
	</div>
	</div>
</div>

<%@include file="common/footer.jsp" %>
</body>
</html>