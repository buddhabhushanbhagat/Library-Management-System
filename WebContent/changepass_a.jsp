<!DOCTYPE html>
<html>
<head>
	<title></title>
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
	<script type="text/javascript">
	function check()
	{
	    var v1=document.getElementById(oapass).value; 
	    var v2=document.getElementById(napass).value;
	   if(v2!=v1) 
	    { 
	     document.getElementById(sp).innerHTML=Not Matched; 
	      document.getElementById(sp).style.color=green; 
	    } 
	    else 
	    { 
	      document.getElementById(sp).innerHTML=Matched; 
	      document.getElementById(sp).style.color=red; 
	    } 
	  } 
	</script>
	
</head>
<body>
<nav class="navbar ">
	  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="admin_home.jsp">Home</a>
    </div>
	<ul class="nav navbar-nav">
			<li><a href="borrow.jsp">Borrow</a></li>
			<li><a href="return.jsp">Return</a></li>
			<li><a href="add_admin.jsp">Add Admin</a></li>
			<li><a href="add_student.jsp">Add Student</a></li>
			<li><a href="add_book.jsp">Add Book</a></li>
			<li class="dropdown " ><a class="dropdown-toggle" data-toggle="dropdown" href="#">View Records<span class="caret"></span></a>
				 <ul class="dropdown-menu">
				 	<li><a href="show.jsp">Student Record</a></li>
      			    <li><a href="admin_record.jsp">Admin Record</a></li>
      			    <li><a href="books_record.jsp">Book's Record</a></li>
       			   <li><a href="logout.jsp">Logout</a></li>
       			 </ul> 
			</li>
			<li class="dropdown " ><a class="dropdown-toggle" data-toggle="dropdown" href="#">Setting<span class="caret"></span></a>
				 <ul class="dropdown-menu">
      			    <li><a href="changepass_a.jsp">Change Password</a></li>
       			   <li><a href="logout.jsp">Logout</a></li>
          
       			 </ul>
			</li>
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
			<form action="changepass_a.jsp" method="post">
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
							  
							<center><span id=sp class=mt-3></span></center>
							
							<div class="row">
								<div class="col-md-4 mt-1">
									<div class="form-group">
										<label for="napass" class="form-control" >New Password:</label>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										 <input type="password" class="form-control"  placeholder="Enter New Password" name="napass" id="napass" onkeyup=check()>
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
	if(opass.equals(pass))
	{
		if(!npass.equals(opass))
		{	
			if(npass.equals(cpass))
			
		{
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp",
	            "root", "");
	   		Statement st = con.createStatement();
	  	    ResultSet rs;
		 	int i=st.executeUpdate("update admin_login set pass='"+cpass+"' where uname='"+name+"'");
		 	if(i>0)
		 	{
		 		out.print("<script>alert('Password has been Changed!!')</script>");
		 		out.println("<script>window.location='changepass_a.jsp'</script>");
		 	}
	 
		}
			
			else{
				out.print("<script>alert('Password did not matched')</script>");
				out.println("<script>window.location='changepass_a.jsp'</script>");
				}
		
	}
		
else{
			out.print("<script>alert('New Password and Old Password can't be same!!')</script>");
			out.println("<script>window.location='changepass_a.jsp'</script>");
	}
			
		}
		
	
	else{
		out.print("<script>alert('Entered Password is Wrong')</script>");
		out.println("<script>window.location='changepass_a.jsp'</script>");
	}			
}

%>