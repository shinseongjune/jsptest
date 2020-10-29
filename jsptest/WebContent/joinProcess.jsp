<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
		
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/ms");
		conn = ds.getConnection();
		
		pstmt=conn.prepareStatement("insert into members values (?,?,?,?,?,?)");
		pstmt.setString(1,id);
		pstmt.setString(2,pass);
		pstmt.setString(3,name);
		pstmt.setInt(4,age);
		pstmt.setString(5,gender);
		pstmt.setString(6,email);
		int result=pstmt.executeUpdate();
		
		if (result!=0) {
			out.println("<script>");
			out.println("location.href='loginform.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("location.href='joinForm.jsp'");
			out.println("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>