<%@include file="db.jsp" %>
<%@page import="java.util.*" %>
<%
//generate randoms 
Random rand = new Random();
int operand1 = rand.nextInt(10) + 1;
int operand2 = rand.nextInt(10) + 1;
int capcha_answer = operand1 + operand2; 
//set session values for capcha
session.setAttribute("operand1",operand1);
session.setAttribute("operand2", operand2);
session.setAttribute("capcha_answer", capcha_answer);	


%>

<html>
<head>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h1My Information Security Blog</h1>
<h2>Please register</h2>
<form action="register_action.jsp" method="POST">
<label>Your Name:</label><input name="fullname" /><br>
<label>Login ID:</label><input name="user" /><br>
<label>Password:</label> <input name="pass" type="password" /><br>
<label>Roles:</label><br>
<input name="role" type="radio" value="normal" checked> Normal
<input name="role" type="radio" value="admin"> Administorator
<br>
<h3>Answer the following question.</h3><br>
<h4><%= session.getAttribute("operand1") %> +
 <%=session.getAttribute("operand2") %> </h4>
<input name="capcha">
<input type="submit" value="Register"/>
</form>

</body>
</html>
