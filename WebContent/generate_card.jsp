
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="print.js"></script>
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
<body style="background: #198c8c">
	<nav class="navbar ">
	  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="student_home.jsp">Home</a>
    </div>
	<ul class="nav navbar-nav">
			<li><a href="profile.jsp">Profile</a></li>
			<li><a href="changepass_s.jsp">Change Password</a></li>
			<li><a href="generate_card.jsp">Generate Card</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		  </ul>
		</div>
</nav>
      <%
    if(session.getAttribute("user_type")==null)
				{
					response.sendRedirect("login.jsp");
				}
				else
				{
					String nm=(String)session.getAttribute("userid");
					int uid=Integer.parseInt(nm);
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp","root","");
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("select * from students where rollno ='"+uid+"'");
					if(rs.next())
					{
						%>
						
	<center>
	<div class="card">
	<div class="card-header">
				<div class="card-title">
					<h1>Generate Card!!!</h1>
				</div>
	</div>
	<div class="card-body">
		<form action="generate_card.jsp" method="post">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4 mt-1">
					<div class="form-group">
						<img src="https://www.atomix.com.au/media/2015/06/atomix_user31.png" class="rounded-circle mt-5" style="max-width: 200px" >
					</div>
				</div>
				<div class="col-md-4"></div>
				

				<div class="col-md-5 mt-1">
					<div class="form-group">
						<label for="sroll" class="form-control" readonly>Student Rollno:</label>
					</div>
				</div>
				<div class="col-md-7">
					<div class="form-group">
						<input type="number" name="sroll" id="sroll" readonly value="<%=rs.getString("rollno")%>"  class="form-control" required>
					</div>
				</div>	
				<div class="col-md-5 mt-1">
					<div class="form-group">
						<label for="bid" class="form-control"  readonly >Student Name:</label>
					</div>
				</div>
				<div class="col-md-7">	
					<div class="form-group">
						<input type="numbers" name="sname" id="sname" readonly value="<%=rs.getString("name")%> " class="form-control" required>
					</div>
				</div>	
				<div class="col-md-5 mt-1">
					<div class="form-group">
						<label for="bdate" class="form-control" readonly >Student Mobile:</label>
					</div>
				</div>
				<div class="col-md-7">	
					<div class="form-group">
						<input type="numbers" name="bdate" id="bdate" readonly value=" <%=rs.getString("mobile")%>" class="form-control" required>
					</div>
				</div>	
					<div class="form-group">
						<input type="submit" name="btn-borrow_book" value="Print" onClick="window.print()" class="btn btn-danger form-control  ">
					</div>
				</div>
		</form>
	</div>

</div>
</center>
			

 
 <%
					}
				}
			%>
</body>
</html>
