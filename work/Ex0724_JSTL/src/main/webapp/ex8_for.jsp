<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>JSTL연습</h1>
  <c:set var="cnt" value="5"/>
  <c:set var="sist" value="쌍용교육센터"/>
  <ul>
    <c:forEach begin="1" end="${cnt}">
      <li>${sist}</li>
    </c:forEach>
  </ul>
  <hr/>
<%
  String[] ar = {"자바", "스프링", "파이썬", "Fast-API"};
  /*스크립트릿에서는 변수 선언이 안된다. 근데 request나 세션에 저장하면 가능하다!*/
  request.setAttribute("ar", ar);
%>
  <ol>
    <c:forEach items="${requestScope.ar}" var="str">  <%--request를 저장했으니 requestScope로 받자!--%>
      <li>${str}</li>
    </c:forEach>
  </ol>
</body>
</html>
