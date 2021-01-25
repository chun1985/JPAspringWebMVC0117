<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start</title>
</head>
<body>
<br><h1>Start</h1>
<form action = "Start.jsp" method = "get">
<input type = "radio" name ="run" value = "1" checked >home<br>
<input type = "radio" name ="run" value = "2" >supplier<p>
<input type = "submit" value = "submit">
<%
String run = request.getParameter("run");
if("1".equals(run)){%>
<jsp:forward page="home"></jsp:forward>	
<% } else if("2".equals(run)){%>
<jsp:forward page="supplier"></jsp:forward>	
<% } %>
</form>
</body>
</html>