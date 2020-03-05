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
	<div class="card">
	<div class="card-header">
				<div class="card-title">
					<h1>Borrow Book!!!</h1>
				</div>
	</div>
	<div class="card-body">
		<form action="borrow.jsp" method="post">
			<div class="row">
				<div class="col-md-5 mt-1">
					<div class="form-group">
						<label for="sroll" class="form-control" >Student Rollno:</label>
					</div>
				</div>
				<div class="col-md-7">
					<div class="form-group">
						<input type="number" name="sroll" id="sroll" class="form-control" required>
					</div>
				</div>	
				<div class="col-md-5 mt-1">
					<div class="form-group">
						<label for="bid" class="form-control" >Book Id:</label>
					</div>
				</div>
				<div class="col-md-7">	
					<div class="form-group">
						<input type="number" name="bid" id="bid" class="form-control" required>
					</div>
				</div>	
				<div class="col-md-5 mt-1">
					<div class="form-group">
						<label for="bdate" class="form-control" >Borrow Book Date:</label>
					</div>
				</div>
				<div class="col-md-7">	
					<div class="form-group">
						<input type="date" name="bdate" id="bdate" class="form-control" required>
					</div>
				</div>	
					<div class="form-group">
						<input type="submit" name="btn-borrow_book" value="Submit" class="btn btn-danger form-control  ">
					</div>
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
String btn=request.getParameter("btn-borrow_book");
//out.print("<script>alert('"+btn+"')</script>");
if(btn==null){
	
}
else if(btn.equals("Submit")){
	try
	{
	
    String srollno = request.getParameter("sroll");    
    String bookid = request.getParameter("bid");
    String borrowbdate = request.getParameter("bdate");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp","root","");
    Statement st = con.createStatement();
    //ResultSet rs;
 int i = st.executeUpdate("INSERT INTO `borrow`(`student_roll_no`, `book_id`, `borrow_bdate`) VALUES ('"+srollno+"','"+bookid+"','"+borrowbdate+"')");
      if (i > 0) {
        //session.setAttribute("userid", user);
        out.print("<script>alert('Book Issuied Succesfully')</script>");
      out.println("<script>window.location='borrow.jsp'</script>");
    //  response.sendRedirect("add_student.jsp");
      }
       
     else {
        out.println("error in inserting");
    }
	}catch(Exception e)
      {
    	  out.println("<script>alert('Book Alredy Issued')</script>");
      }
}
else{
	
}
%>