
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ page import="com.javaex.guestbook.*" %>
<%@ page import="javax.swing.*" %>

<%
request.setCharacterEncoding("UTF-8");
// addList에서의 파라미터 값 받기

String name = request.getParameter("name");
String password = request.getParameter("password");
String content = request.getParameter("content");

if(content != "" && name != "" && content != "" ){
	GuestBookVo gv = new GuestBookVo(name, password, content);
	GuestBookDao gd = new GuestBookDao();
	gd.insert(gv);
	response.sendRedirect("./addList.jsp");
}
else{
	response.getWriter().print("이름, 비밀번호, 내용을 반드시 입력해주세요");
	
}

%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>