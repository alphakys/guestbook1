<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.guestbook.*" %>
<%@ page import = "java.util.List"%>


<%
request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("no"));

String password = request.getParameter("password");

GuestBookDao gd = new GuestBookDao();

GuestBookVo gv = gd.getGuest(num);

	if(password.equals(gv.pw)){
		gd.delete(num);
	
		response.sendRedirect("./addList.jsp");
		}
	else{
		response.getWriter().print("다시 입력해주세요");
		}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<br>
		<a href="deleteForm.jsp?no=<%=num%>">비밀번호 다시 입력하기</a>
</body>
</html>