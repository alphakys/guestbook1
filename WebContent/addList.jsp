<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.guestbook.*" %>
<%@ page import = "java.util.List"%>

<% 
GuestBookDao gd = new GuestBookDao();

List<GuestBookVo> list = gd.getList();


%>


<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	
	<title>~강용수의 방명록~</title>
	
	<style>
		table{ border-collapse:collapse;}
			
		table{width:50%; }
		
	</style>
	
	
</head>

<body>
	<form action="add.jsp" method="post" accept-charset="UTF-8">
		<table border = '1' >
			<tr>
				<td>이름</td>
				<td><input type = "text" name="name"></td>
				<td>비밀번호</td>
				<td><input type = "text"  name="password"></td>
			</tr>
			
			<tr>
				<td colspan='4'><textarea cols="50%" rows="20" name="content"></textarea></td>
				
			</tr>
			
			<tr width="30px">
				<td><button type = "submit">확인</button></td>
			</tr>
		</table>
	</form>
	
	<br>
	<br>
	
		<%for(int i=0; i< list.size(); i++){ %>
	 	<table border = '1'>
			<tr>
				<td><%=list.get(i).no%></td>
				<td><%=list.get(i).name%></td>
				<td><%=list.get(i).date%></td>
				<td><a href="deleteForm.jsp?no=<%=list.get(i).no%>">삭제</a></td>
			</tr>
			
			<tr>
				<td colspan='4'><%=list.get(i).content%></td>	
			</tr>
			
		</table>
		<br>
		<br>
	<%} %>
	
	
	
	
	
	
</body>
</html>