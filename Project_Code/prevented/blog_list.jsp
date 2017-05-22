<%@include file="db.jsp" %><%

String user = (String) session.getAttribute( "user" );
String username = (String) session.getAttribute( "username" );
if (null == user) {
	response.sendRedirect("login_form.html"); 
}

//Check user
String sql_query = "SELECT title, content, id FROM blog WHERE user=? ";
PreparedStatement prepared_statement = con.prepareStatement(sql_query);
prepared_statement.setString(1,user);
//Statement stmt = con.createStatement();

ResultSet rs = prepared_statement.executeQuery();
%>
<html>
<head>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h1>My CS166 Blog Site <span style="float:right"> Welcome <%= user %> &nbsp;&nbsp;&nbsp;&nbsp;<a href="logout_action.jsp">logout</a> &nbsp;&nbsp;&nbsp;&nbsp;</span></h1>

<hr>
<h1>Blog entries</h1>
<%	
while ( rs.next() ) {
	out.print("<div class='blogitem'><h3> title:" + rs.getString(1) +"   id:"+ rs.getString(3) + "</h3>");
	out.print(rs.getString(2) + "</div>");
}
%>
<hr>

<h3>Add a blog item</h2>
<form action="blog_action.jsp" method="post">
Blog Title: <input name="blogtitle" size=100/><br>
<textarea name="blogcontent" rows="10" cols="100"></textarea><br>
<input type="submit" value="Add Blog"/>
</form>
<h3>Delete a blog item</h3>
<form action="blog_delete.jsp" method="post">
	Blog ID: <input name="blog_id"/> <br>
	<input type="submit" name="delete"> 
</form>



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
