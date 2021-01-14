<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.javaex.guestbook.*" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));

GuestBookDao gd = new GuestBookDao();

GuestBookVo gv = gd.getGuest(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
		<form action="add.jsp" method="post" accept-charset="UTF-8">
		<table border = '1' >
		
			<tr>
				<td>이름</td>
				<td><input type = "text" name="name" value="<%=gv.name%>"></td>
				<td>비밀번호</td>
				<td><input type = "text"  name="password" value=""></td>
			</tr>
			
			<tr>
				<td colspan='4'><textarea cols="50%" rows="20" name="content"></textarea></td>
				
			</tr>
			
			<tr width="30px">
				<td><button type = "submit">수정</button></td>
			</tr>
			
		</table>
	</form>
		
		
		
		
		
</body>
</html>