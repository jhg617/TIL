
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>${param.m_id}</h2> <%--JSTL EL언어(Java 코드를 사용하지 않고도 데이터를 쉽고 간결하게 출력하거나 접근)--%>
  <h2>${param.m_pw}</h2> <%--client 측에게 화면을 뿌려준다.--%>
  <h2>${param.m_name}</h2>
  <h2>${param.now}</h2>
</body>
</html>
