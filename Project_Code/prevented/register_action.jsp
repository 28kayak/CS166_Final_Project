<%@include file="db.jsp" %>
<%@page import="java.util.*" %>
<%
//check capcha 
String user_ans = request.getParameter("capcha");
String answer = String.valueOf(session.getAttribute("capcha_answer"));
if(user_ans.equals(answer))
{
	//ensured that registration is done by human beings.
	//get form input
	String fullname = request.getParameter( "fullname" );
	String user = request.getParameter( "user" );
	String pass = request.getParameter( "pass" );
	String role = request.getParameter("role");
	Random rand = new Random();
	int random = rand.nextInt(100) + 1;


	//make a salted password
	pass = pass + random; 
	
	String sqlStr = "insert into login(fullname,user, pass, role, random) values ('" + fullname + "', '" + user + "', sha2('"+ pass + "', 256), '" + role + "' , '" + random + "')";

	Statement stmt = con.createStatement();
	stmt.execute(sqlStr);
	session.setAttribute("capcha_result", true);
	response.sendRedirect("login_form.html"); 
}
else
{
	session.setAttribute("capcha_result", false);
	response.sendRedirect("register_form.jsp");
}


%>





<%
//Correct
/*
String sqlStr = "insert into login(fullname,user, pass) values (?,? sha2(?, 256))";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,fullname);
stmt.setString(2,user);
stmt.setString(3,pass);
ResultSet rs = stmt.execute();
*/
//SQL injection attack
// a' OR 1=1 -- 
%>
