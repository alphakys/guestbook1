<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
String no = request.getParameter("no");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방명록의 비밀번호를 입력하세요</h3>
	
	
	<form action="delete.jsp" method="post">
		비밀번호 <input type="text" name= "password"> <button type= "submit">확인</button>
		<input type="hidden" name="no" value="<%=no%>">
	
	</form>
</body>
</html>