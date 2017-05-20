<%@include file="db.jsp" %><%

//Check user
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
String sqlStr2 = "SELECT * FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement prepared_statement1 = con.prepareStatement(sqlStr2);
prepared_statement1.setString(1,user);
prepared_statement1.setString(2,pass);
ResultSet rs1 = prepared_statement1.executeQuery();
if ( rs1.next() ) {
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs1.getString(1) );
	response.sendRedirect("blog_list.jsp");	
} else {
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
