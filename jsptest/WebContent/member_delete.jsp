<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF8");
%>
<%
	String id=null;

	if ((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginform.jsp'");
		out.println("</script>");
	}
	
	String delete_id=request.getParameter("id");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/ms");
		conn = ds.getConnection();
		pstmt=conn.prepareStatement("delete from members where id=?");
		pstmt.setString(1,delete_id);
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("location.href='member_list.jsp'");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>