<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
      String s_num = request.getParameter("s_num");
      //s_num은 문자열이므로 연산 불가. 그래서 정수로 변환해야한다.
        //if(s_num != null) {
        int dan = Integer.parseInt(s_num);
    %>
<h2>입력한 값:<%=s_num%></h2>
<% //스크립트 릿
  StringBuffer sb = new StringBuffer();
  for (int i=1; i<10; i++){
    sb.append(dan);
    sb.append("*");
    sb.append(i);
    sb.append("=");
    sb.append(dan*i); //5*1=5<br/>
    sb.append("<br/>");
  }
%>
  <%=sb.toString()%> <%--출력문--%>
</body>
</html>
