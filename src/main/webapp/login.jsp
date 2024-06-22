<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login page</title>
<%@include file="common/allcss.jsp" %>
</head>
<body >
<%@include file="common/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
					<i class="fa fa-user fa-3x" aria-hidden="true"></i>
					<h4>Login</h4>
					</div>
					
					<%
					String regms=(String)session.getAttribute("login-failed");
					if(regms!=null)
					{
						%>
						<div class="alert alert-danger" role="alert"><%=regms %></div>
						<% 
						session.removeAttribute("login-failed");
					}
					%>
					
					<%
					   String withoutlogin=(String)session.getAttribute("login-error");
					   if(withoutlogin!=null)
					   {%>
						   <div class="alert alert-danger" role="alert"><%=withoutlogin %></div>
						   
					   <% session.removeAttribute("login-error");
					   }
					%>
					
					<%
					 String logoutm=(String)session.getAttribute("logoutmsg");
					if(logoutm!=null)
					{%>
					 <div class="alert alert-success" role="alert"><%=logoutm %></div>
					<% 
					session.removeAttribute("logoutmsg");
					}
					
					%>
					<div class="card-body">
						<form action="loginServlet" method="post">
						
							<label>Enter Email </label>
							<div class="form-group">
								
								<input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" name="uemail" Required="required">
								
							</div>
							<label>Create Password</label>
							<div class="form-group">
								<input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="upass"  Required="required">
							</div>
							
							<button type="submit" class="btn btn-primary btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	<div class="container-fluid bg-dark mt-2">
<p class="text-center text-white">created by sakku</p>
<p  class="text-center text-white">any problem then contact me sakshi31patidar@gmail.com</p>
</div>


</body>
</html>
