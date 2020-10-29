<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체 사용 예제</title>
</head>
<body>
	<h3>${sessionScope.test} : <%=(String)session.getAttribute("test") %></h3> <!-- 어느 스코프에 유일한 값이라면 스코프 생략 가능 -->
	<h3>${param.name} : <%=request.getParameter("name") %></h3>
	<!-- 자바 변수는 불러올 수 없다 -->
</body>
</html>