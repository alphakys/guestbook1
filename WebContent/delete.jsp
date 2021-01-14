<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.guestbook.*" %>
<%@ page import = "java.util.List"%>


<%
	request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("no"));

String password = request.getParameter("password");

String name = request.getParameter("name");

GuestBookDao gd = new GuestBookDao();
%>	
		
	
		
		
	



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% if(gd.delete(num, name, password)==1){ %>
			
			삭제되었습니다.<br>
			
			<a href="addList.jsp">메인으로 돌아가기</a>
			<%} else{%>
				
				비밀번호가 틀렸습니다.<br><br>
			<a href="deleteForm.jsp?no=<%=num%>">비밀번호 다시 입력하기</a>
			
			<%} %>
			
		<br>
		
</body>
</html>