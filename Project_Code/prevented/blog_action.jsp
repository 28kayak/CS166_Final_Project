<%@include file="db.jsp" %>
<%@page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String blogcontent = request.getParameter( "blogcontent" );
String user = (String) session.getAttribute( "user" );
String escaped_title = StringEscapeUtils.escapeXml10(blogtitle);
String escaped_content = StringEscapeUtils.escapeXml10(blogcontent);


String sqlStr = "insert into blog (title,content,user) values ('" + escaped_title + "', '" + escaped_content + "', '" + user + "')"; 
Statement stmt = con.createStatement();
stmt.execute(sqlStr);
response.sendRedirect("blog_list.jsp"); 
%>

<%
//SQL injection attack
// a ' OR '1'='1' -- 
//Users', (select GROUP_CONCAT(fullname) from login), 'hacker') -- 
%>
