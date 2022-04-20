<%@page import="com.db.SQLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
%>
<%

int sell = Integer.parseInt(request.getParameter("sell"));
if (sell != 0) {
	try {
		Connection con = SQLConnection.getConnection();
		String sql = "Update home set sell=?,list=?,livings=?,rooms=?,beds=?,baths=?,age=?,acres=?,taxes=? where sell="
		+ sell;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(request.getParameter("sell")));
		ps.setInt(2, Integer.parseInt(request.getParameter("list")));
		ps.setInt(3, Integer.parseInt(request.getParameter("living")));
		ps.setInt(4, Integer.parseInt(request.getParameter("rooms")));
		ps.setInt(5, Integer.parseInt(request.getParameter("beds")));
		ps.setInt(6, Integer.parseInt(request.getParameter("baths")));
		ps.setInt(7, Integer.parseInt(request.getParameter("age")));
		ps.setFloat(8, Float.parseFloat(request.getParameter("acres")));
		ps.setInt(9, Integer.parseInt(request.getParameter("taxes")));
		int i = ps.executeUpdate();
		if (i > 0) {
			out.print("Record Updated Successfully");
		} else {
			out.print("There is a problem in updating Record.");
		}
	} catch (SQLException sql) {
		request.setAttribute("error", sql);
		out.println(sql);
	}
	response.sendRedirect("Front.jsp");
}
%>