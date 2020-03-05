<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: #198c8c">
    

    <div class="container">
        <div class="row">
            <div class="col-md-4 m-auto pt-5" >
                <form method="post" action="login.jsp">
                    <div class="card"`>
                    
                    <div class="card-body">
                    <div class="form-group">
                                <label for="user_type">Select User:</label>
                        <select id="user_type" name="user_type" class="form-control">
                            <option value="Admin">Admin</option>
                            <option value="Student">Student</option>
                        </select>
                                
                    </div>
                        <div class="form-group">
                            <label for="uname">Enter Username: <span  class="caret"></span></label>
                            <input type="text" name="uname" id="uname" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="pass">Enter Password:</label>
                            <input type="password" name="pass" id="pass" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                 <div class="col-md-6">
                                <input type="submit" name="btn-login" value="Login" class="btn btn-danger form-control  ">
                            </div>
                            <div class="col-md-6"> <input type="reset" value="Reset" class=" btn btn-danger form-control" />
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                
            </div>
        </div>
    </div>

<div class="text-center text-white">
      <div class="container">
        <small>Copyright &copy; My Website 2018</small>
      </div>
    </div>
</body>
</html>
<%@ page import ="java.sql.*" %>
<%

String btn=request.getParameter("btn-login");
//out.print("<script>alert('"+btn+"')</script>");
if(btn==null){
	
}
else if(btn.equals("Login")){
	
	///
	if(session.getAttribute("admin")!=null)
	{
		 response.sendRedirect("admin_home.jsp");
	}
	else  if(session.getAttribute("student")!=null)
	{
		 response.sendRedirect("student_home.jsp");
	} 

     String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String user_type =request.getParameter("user_type");
    
    
 
    if(user_type.equals("Admin"))
	{
	try{

    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin_login where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("pwd", pwd);
        session.setAttribute("user_type",user_type);
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("admin_home.jsp");
   			 }
    else{
    	response.sendRedirect("login.jsp");
    }
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.print(e);
	}
	}
    else
    {
    	try{
    		
    	
    	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/libraby_jsp",
                "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from students where rollno='" + userid + "' and pass='" + pwd + "'");
        if (rs.next()) {
            session.setAttribute("userid", userid);
            session.setAttribute("user_type",user_type);
            session.setAttribute("pwd",pwd);
            //out.println("welcome " + userid);
            //out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("student_home.jsp");
        } 
        else{
        	response.sendRedirect("login.jsp");
        }
    	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    } 
	///
}
else{
	
}
	
%>