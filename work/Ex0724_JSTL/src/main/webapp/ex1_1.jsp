<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //한글처리
  request.setCharacterEncoding("utf-8");
  request.setAttribute("age", 30);
%>
  <h2>HttpSession에 저장된 값:${sessionScope.s1}</h2>
  <h2>파라미터 V1 값:${param.v1}</h2>
  <h2>파라미터 U_NAME 값:${param.u_name}</h2>
  <h2>request에 저장된 age값:${requestScope.age}</h2>

</body>
</html>
