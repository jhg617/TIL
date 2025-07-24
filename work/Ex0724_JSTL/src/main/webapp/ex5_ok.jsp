<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- JSTL변수 정의: 이때 파라미터 중 count의 값을 선언된 변수의 값으로 지정하자 --%>
<c:set var="i" value="${param.count}"/>
  <%-- i의 값이 5이상이면 "50%이상", 그렇지 않으면 "50%미만"을 표현하자 --%>
  <h2>
    <c:if test="${i != null and i >= 5}">50%이상</c:if>
    <c:if test="${i != null and i < 5}">50%미만</c:if>
  </h2>
</body>
</html>
