<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.guestbook.*" %>

<%
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt(request.getParameter("no"));


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방명록의 아이디와 비밀번호를 입력하세요</h3>
	
	<p>비밀번호가 틀리면 다시 입력하셔야 합니다</p>
	
	
	<form action="delete.jsp" method="get">
		아이디 <input type="text" name= "password"> <br>
		비밀번호 <input type="text" name= "password"> <button type= "submit">확인</button>
		<input type="hidden" name="no" value="<%=no%>">
	</form>
	
</body>
</html>