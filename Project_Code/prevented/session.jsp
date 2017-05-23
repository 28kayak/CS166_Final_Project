<!DOCTYPE html>
<html>
<head>
	<title>Session</title>
</head>
<body>
<fieldset>
<h1>Session Information</h1>
<td>User: </td>
<td><input type="text" value='<%= session.getAttribute("user") %>' /></td> <br>
<td>Username: </td>
<td><input type="text" value='<%= session.getAttribute("username") %>' /></td> <br>
<td>ROLE </td>
<td><input type="text" value='<%= session.getAttribute("DB_role") %>' /></td> <br>
<td>operand1: </td>
<td><input type="text" value='<%= session.getAttribute("operand1") %>' /></td><br>
<td>operand2:</td>
<td><input type="text" value='<%= session.getAttribute("operand2") %>' /></td><br>
<td>Capcha Answer: </td>
<td><input type="text" value='<%= session.getAttribute("capcha_answer") %>' /></td><br>
<td>synchronized token pattern </td>
<td><input type="text" value='<%= session.getAttribute("sync_token") %>' /></td><br>
<br>
<br>
<a href="logout_action.jsp">logout</a>
</fieldset>

</body>
</html>
