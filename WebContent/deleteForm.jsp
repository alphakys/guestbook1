<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("no");

int no =Integer.parseInt(num);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방명록의 비밀번호를 입력하세요</h3>
	<%=no%>
	<p>비밀번호가 틀리면 다시 입력하셔야 합니다</p>
	
	<form action="delete.jsp" method="get">
		
		비밀번호 <input type="text" name= "password" value="<%=no%>"> <button type= "submit">확인</button>
			  <input type="hidden" name="no" value="<%=no%>">
	</form>
	
</body>
</html>