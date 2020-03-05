<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		 .navbar{
		
			background: #2C3E50;
		}
		        a.navbar-brand:focus, a.navbar-brand:hover, a.navbar-brand:active {
 				 color: #ffffff;
				}
		.dropdown-menu{
			color:#ffffff;
			background: #2C3E50;
		}	
		body{
		
			background-color: #18BC9C;
		}			 
		small{
			color: #ffffff;
		}
	.card{
			width: 500px;
			height: 500px;
		}
	</style>
</head>
<body>

<body style="background: #198c8c">
	<nav class="navbar ">
	  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="student_home.jsp">Home</a>
    </div>
	<ul class="nav navbar-nav">
			<li><a href="">Profile</a></li>
			<li><a href="changepass_s.jsp">Change Password</a></li>
			<li><a href="generate_card.jsp">Generate Card</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		  </ul>
		</div>
</nav>
<center>
		<div class="card ">
		
			<div class="card-header">
				<div class="card-title">
					<h1>Change Password!!!</h1>
				</div>
			</div>
			<div class="card-body">
			<form action="changepass_s.jsp" method="post">
				<div class="row">
								<div class="col-md-4 mt-1">
									<div class="form-group">
										<label for="oapass" class="form-control" >Old Password:</label>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										 <input type="password" class="form-control"  placeholder="Enter Old Password" name="oapass" id="oapass" >
									</div>
							
								</div>
						
							</div>
							<div class="row">
								<div class="col-md-4 mt-1">
									<div class="form-group">
										<label for="napass" class="form-control" >New Password:</label>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										 <input type="password" class="form-control"  placeholder="Enter New Password" name="napass" id="napass" >
									</div>
							
								</div>
						
							</div>
							<div class="row">
								<div class="col-md-4 mt-1">
									<div class="form-group">
										<label for="capass" class="form-control" >Confirm Pass:</label>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										 <input type="password" class="form-control"  placeholder="Enter Password Again" name="capass" id="capass" >
									</div>
							
								</div>
						
							</div>
							
							
										<div class="form-group">  
										 <input type="submit" name="btn-changepass" value="Submit" class="btn btn-danger form-control  ">
										</div>
					
			</form>
			</div>
		
	</div>
		
	</center>
			
<div class="text-center ">
      <div class="container">
        <small>Copyright &copy; My Website 2018</small>
      </div>
    </div>
    
      	   <%
    if(session.getAttribute("user_type")==null)
				{
					response.sendRedirect("login.jsp");
				}
				else
				{
					
				}
			%>

</body>
</html>
<%@ page import ="java.sql.*" %>
<%
String btn=request.getParameter("btn-changepass");
//out.print("<script>alert('"+btn+"')</script>");
if(btn==null){
	
}

else if(btn.equals("Submit")){

	String opass=request.getParameter("oapass");
	String npass=request.getParameter("napass");
	String cpass=request.getParameter("capass");
	
	
	String pass=(String)session.getAttribute("pwd");
	String name=(String)session.getAttribute("userid");
	int uid=Integer.parseInt(name);
	if(opass.equals(pass))
			{
				if(npass.equals(cpass))
				{
					Class.forName("com.mysql.jdbc.Driver");
			    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp",
			            "root", "");
			   		Statement st = con.createStatement();
			  	    ResultSet rs;
				 	int i=st.executeUpdate("update students set pass='"+cpass+"' where rollno='"+uid+"'");
				 	if(i>0)
				 	{
				 		out.print("<script>alert('Password has been Changed!!')</script>");
				 	}
			 
				}
				else{
					out.print("<script>alert('Password did not matched')</script>");
				}
			}
	else{
		out.print("<script>alert('Entered Password is Wrong')</script>");
	}
    	
				
}



%>