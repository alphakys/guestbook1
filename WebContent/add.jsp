<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ page import="com.javaex.guestbook.*" %>

<%
request.setCharacterEncoding("UTF-8");
// addList에서의 파라미터 값 받기
String name = request.getParameter("name");
String password = request.getParameter("password");
String content = request.getParameter("content");

// 받은 파라미터 값 인스턴스
GuestBookVo gv = new GuestBookVo(name, password, content);

// Dao에 insert
GuestBookDao gd = new GuestBookDao();
gd.insert(gv);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%response.sendRedirect("./addList.jsp"); %>
</body>
</html>