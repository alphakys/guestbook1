<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.guestbook.*" %>
<%@ page import = "java.util.List"%>


<%
int no = Integer.parseInt(request.getParameter("no"));

String password = request.getParameter("password");

GuestBookDao gd = new GuestBookDao();
gd.delete(no);


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