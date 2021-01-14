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
	<title>방명록 리스트</title>
	<style>
		table{width:50%; }
		
	</style>
</head>
<body>

	<%for(int i=0; i< list.size(); i++){ %>
	 	<table border = '1'>
			<tr>
				<td><%=list.get(i).no  %></td>
				<td><%=list.get(i).name  %></td>
				<td><%=list.get(i).date  %></td>
				<td><a href="deleteForm.jsp">삭제</a></td>
			</tr>
			
			<tr>
				<td colspan='4'><%=list.get(i).content  %></td>	
			</tr>
			
		</table>
		<br>
		<br>
	<%} %>
	
	
</body>
</html>