<%@include file="db.jsp" %><%
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String blogcontent = request.getParameter( "blogcontent" );
String user = (String) session.getAttribute( "user" );
String blog_id = request.getParameter("blog_id");

//get user information 
String sql = "select role from login where user=?";
PreparedStatement prep_stmt = con.prepareStatement(sql);
prep_stmt.setString(1, user);
ResultSet rs = prep_stmt.executeQuery();
rs.next();
if(rs.getString(1).equals("normal"))
{
	//user is normal user
	String delete_query = "delete from blog where id=? and user=?";
	PreparedStatement delete_prep = con.prepareStatement(delete_query);
	delete_prep.setString(1,blog_id);
	//user name in the session 
	delete_prep.setString(2, user);
	delete_prep.execute();
	int count = delete_prep.getUpdateCount();
	if(count > 0)
	{
		//sucess 
		response.sendRedirect("blog_list.jsp");	
	}
	else
	{
		response.sendRedirect("login_form.html");
	}




}
else if(rs.getString(1).equals("admin"))
{
	//user is admin
	String delete_query = "delete from blog where id=?";
	PreparedStatement delete_prep = con.prepareStatement(delete_query);
	delete_prep.setString(1,blog_id);
	delete_prep.execute();
}

/*
String sql_query = "Delete from blog where id = ?";
PreparedStatement prepared_statement = con.prepareStatement(sql_query);
prepared_statement.setString(1, blog_id);
ResultSet result = prepared_statement.executeQuery();
if(result.next())
{
	
}*/
%>