<%@include file="db.jsp" %>
<%@page import="java.security.SecureRandom"%>
<%
//get user id and passwrod from html form
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
boolean isAuth = false;
//prepared statement 
String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement prepared_statement = con.prepareStatement(sqlStr);
prepared_statement.setString(1,user);
prepared_statement.setString(2,pass);
ResultSet rs = prepared_statement.executeQuery();
rs.next();
if ( rs.getInt(1) == 1 ) isAuth=true;

//out.print(sqlStr);

//Statement stmt = con.createStatement();
//ResultSet rs1 = stmt.executeQuery(sqlStr);



//***************get user's salt******************************** 
String sql_query = "SELECT * FROM login WHERE user=?";
PreparedStatement prepared_query = con.prepareStatement(sql_query);
prepared_query.setString(1, user);
//execute query and receive result as result set object 
ResultSet result_set = prepared_query.executeQuery();
//Move cursor to the first row 
if(result_set.next())
{
	int user_salt = result_set.getInt("random");
	//add salt to user's password to be same with password in DB
	pass = pass + user_salt;
}

//
String sqlStr2 = "SELECT * FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement prepared_statement1 = con.prepareStatement(sqlStr2);
prepared_statement1.setString(1,user);
prepared_statement1.setString(2,pass);
ResultSet rs1 = prepared_statement1.executeQuery();
if ( rs1.next() ) {
	//*****************login success********************* 
	//*** add synchonizer token 
	//generate secure random for synchonizer token 
	SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
	int sync_token = secureRandom.nextInt();
	//***** set session valiables ********
	session.setAttribute("DB_role", rs1.getString("role"));
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs1.getString("fullname") );
	session.setAttribute("sync_token",sync_token );

	//***** send back blog list page ******
	response.sendRedirect("blog_list.jsp");	

} 
else
{
	//************ not able to login ************
	response.sendRedirect("login_form.html");
}
%>




<%
//Correct
/*
String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,name);
stmt.setString(2,pwd);
ResultSet rs = stmt.executeQuery();
rs.next();
if ( rs.getInt(1) == 1 ) isAuth=true;
*/

//SQL injection attack
// a ' OR '1'='1' -- 

%>
