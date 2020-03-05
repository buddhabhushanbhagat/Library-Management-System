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
					<h1>Welcome to Library!!!</h1>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group">
					
					<a href="borrow.jsp" class="btn btn-primary form-control mb-2">Borrow Book</a>
					<a href="return.jsp" class="btn btn-secondary form-control mb-2">Return Book</a>
					<a href="add_student.jsp" class="btn btn-success form-control mb-2">Add Student</a>
					<a href="add_admin.jsp" class="btn btn-danger form-control mb-2">Add Admin</a>
					<a href="add_book.jsp" class="btn btn-warning form-control mb-2">Add Book</a>
				
				
				</div>
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
