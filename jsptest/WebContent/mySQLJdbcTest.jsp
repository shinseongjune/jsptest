<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;

	String driver="com.mysql.cj.jdbc.Driver"; //sql 드라이버 위치
	String url="jdbc:mysql://localhost:3306/shopdb?serverTimezone=Asia/Seoul"; //sql 서버/db?타임존(최신버전부터 있어야 접속가능)
	
	boolean connect=false;
	
	try{
		Class.forName(driver); //클래스 이름으로 불러오기
		conn=DriverManager.getConnection(url,"root","yt1234"); //커넥션 생성(주소, 아이디, 비밀번호)
		
		connect=true;
		
		conn.close();
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연동 테스트 예제</title>
</head>
<body>
	<h3>
		<%if(connect==true){ %>
			연결되었습니다.
		<%}else{ %>
			연결에 실패하였습니다.
		<%} %>
	</h3>
</body>
</html>