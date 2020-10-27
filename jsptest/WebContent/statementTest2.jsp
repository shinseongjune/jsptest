<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	Connection conn = null;
	String sql="SELECT * FROM membertbl";
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/shopdb");
		conn = ds.getConnection();
		stmt=conn.createStatement();
		
		rs = stmt.executeQuery(sql);
		out.println("<table border='1' cellpadding='20' cellspacing='0'>");
		out.println("<tr><td>아이디</td><td>이름</td><td>주소</td></tr>");
		while(rs.next()) {
			String id = rs.getString("memberId");
			String name = rs.getString(2);
			String addr = rs.getString(3);
			out.println("<tr>");
			out.println("</tr>");
			out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + addr + "</td></tr>");
		}
		out.println("</table>");
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>