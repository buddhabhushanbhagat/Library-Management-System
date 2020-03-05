 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.*" %>
    
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
			height: 700px;
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
	<div class="form-group">
		<center><label style="font-size: 20px ;margin-top: 10px" ><strong>All Students's Record</strong></label></center>
	</div>
	<table class="col-md-6  table table-dark table-hover text-center" border="1" style=" vertical-align: center; ">
		<tr style="background: #000000 ;color: #ffffff;">
			<th>Name</th>
			<th>Roll No</th>
			<th>Password</th>
			<th>Mobile</th>
		</tr>
		<%
		Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp","root","");
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from students");

				while(rs.next())
				{
				%>
				<tr style="text-align: center;">
		<td>  <%= rs.getString(1) %>     </td>
		<td>  <%= rs.getString(2) %>      </td>
		<td>  <%= rs.getString(3) %>	</td>
		<td>  <%= rs.getString(4) %>    </td>
		</tr>
						
			<%
				}
				%>
				
		</table>	
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