<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	Connection conn = null;
	CallableStatement cs = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/shopdb");
		conn = ds.getConnection();
		cs=conn.prepareCall("{call Get_Annual_Income(?,?)}");
		cs.setString(1,"aaa");
		cs.registerOutParameter(2, java.sql.Types.INTEGER);
		cs.execute();
		out.println("<h3>"+cs.getInt(2)+"</h3>");
	} catch (Exception e) {
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		try {
			if(cs!=null) cs.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>