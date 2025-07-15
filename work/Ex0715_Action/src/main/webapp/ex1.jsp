<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //오늘날짜 구하기
  LocalDate now = LocalDate.now();
%>
<jsp:forward page="ex1_1.jsp">
  <jsp:param name="now" value="<%=now.toString()%>"/>
</jsp:forward>
</body>
</html>
