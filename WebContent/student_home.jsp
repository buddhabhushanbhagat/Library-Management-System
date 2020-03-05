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
			small{
			color: #ffffff;
		}
		h1{
			padding:200px;
			font-size:70px;
		}
	</style>
</head>
<body style="background: #198c8c">
	<nav class="navbar ">
	  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Home</a>
    </div>
	<ul class="nav navbar-nav">
			<li><a href="">Profile</a></li>
			<li><a href="changepass_s.jsp">Change Password</a></li>
			<li><a href="generate_card.jsp">Generate Card</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		  </ul>
		</div>
</nav>
<%String name=(String)session.getAttribute("userid"); %>
  <center>   
 	 <h1>Welcome User <% out.println(name); %></h1>
  </center>  

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