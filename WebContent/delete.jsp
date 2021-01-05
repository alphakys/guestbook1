<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.guestbook.*" %>
<%@ page import = "java.util.List"%>


<%
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt(request.getParameter("no"));

String password = request.getParameter("password");

GuestBookDao gd = new GuestBookDao();

int success = gd.delete(no, password);

if(success!=0){
	response.sendRedirect("./addList.jsp");
}
else{
	response.sendRedirect("./deleteForm.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% %>


</body>
</html>