<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
%>
  <h2>이름:${param.u_name}</h2>
  <h2>전화:${param.u_phone}</h2> <%-- 여러개 중 하나만 받는다 --%>
    <%-- for(String item : ar)--%> <%--배열이다.--%>
    <%--반복문 forEach--%>
    <c:forEach items="${paramValues.u_phone}" var="item"> <%--var를 고치면 ${}안에 값도 고쳐야함}--%>
        <h3>${item}</h3>
    </c:forEach>

</body>
</html>
