
<%@ page  import="java.sql.Connection" %>
<%@ page  import="com.Db.DBConnect" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>

<%@include file="common/allcss.jsp" %>
<style type="text/css">
.back-img{
background: url("img/dd.jpg");
width: 100%;
height: 80vh;
background-repeat: no-repeat;
background-size: cover;
}
</style>
</head>
<body>


	<%@include file="common/navbar.jsp" %>


	<div class="container-fluid back-img">
		<div class="text-center">
		<br/><br/>
			<h1 class="text-black ">Save Your Notes and Data</h1>
			<a href="login.jsp"    class="btn btn-light"><i class="fa fa-user" aria-hidden="true"></i>Login</a>
			<a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
		</div>
	</div>

	<%@include file="common/footer.jsp" %>
</body>
</html>
