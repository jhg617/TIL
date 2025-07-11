<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% //스크립트릿 - 서블릿의 service()함수에 들어간다.(선언부를 제외한 출력문,스크립트 릿이 해당된다)
  String id = request.getParameter("s_id"); //아이디 받기
  String pw = request.getParameter("s_pw"); //비번 받기
%>
  <h2>아이디:<%=id%></h2> <%--출력문1--%>
  <h2>비밀번호:<%=pw%></h2> <%--출력문2--%>
</body>
</html>
