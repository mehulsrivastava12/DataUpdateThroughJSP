<%@page import="com.db.SQLConnection"%>
<%@page import="java.sql.*"%>
<%
String sell = request.getParameter("sell");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
%>
<%
try {
	Connection con = SQLConnection.getConnection();
	Statement st = con.createStatement();
	String sql = "select * from home where sell=" + sell;
	ResultSet rs = st.executeQuery(sql);
	while (rs.next()) {
%>
<!DOCTYPE html>
<html>
<body>
	<h1>Update data from database in jsp</h1>
	<form method="post" action="update-process.jsp">
		<input type="hidden" name="sell" value="<%=rs.getInt(1)%>">
		Sell:<br> <input type="text" name="sell"
			value="<%=rs.getInt(1)%>"> <br> List:<br> <input
			type="text" name="list" value="<%=rs.getInt(2)%>"> <br>
		Living:<br> <input type="text" name="living"
			value="<%=rs.getInt(3)%>"> <br> Rooms:<br> <input
			type="text" name="rooms" value="<%=rs.getInt(4)%>"> <br>
		Beds:<br> <input type="text" name="beds"
			value="<%=rs.getInt(5)%>"> <br> Baths:<br> <input
			type="text" name="baths" value="<%=rs.getInt(6)%>"> <br>
		Age:<br> <input type="text" name="age" value="<%=rs.getInt(7)%>">
		<br> Acres:<br> <input type="text" name="acres"
			value="<%=rs.getFloat(8)%>"> <br> Taxes:<br> <input
			type="text" name="taxes" value="<%=rs.getInt(9)%>"> <br>
		<input type="submit" value="submit">
	</form>
	<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>