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
	
	<h3>수정하시려면 이름 비밀번호를 입력하세요</h3>
	
	<p>이름과 비밀번호가 틀리면 다시 입력하셔야 합니다</p>
	
	
	<form action="checkPw.jsp" method="post">
		이름 <input type="text" name= "name"> <br>
		비밀번호 <input type="text" name= "password"> <button type= "submit">수정하기</button>
		<input type="hidden" name="no" value="<%=no%>">
	</form>
	
</body>
</html>