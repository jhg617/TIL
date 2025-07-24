<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>JSTL연습</h2>
  <%-- JSTL로 변수 선언--%>
  <c:set var="cnt" value="10" scope="page"/>
  <c:set var="v1" value="3" scope="page"/>

  <%-- 0부터 cnt까지 반복하는 반복문 구현 --%>
  <ul>
    <c:forEach begin="1" end="${cnt}" varStatus="vs">
      <%-- vs.index가 3의 배수일 때 출력하지 않도록 비교문을 구현하자 --%>
      <c:if test="${vs.index % v1 != 0}">
        <li>${vs.index}</li>
      </c:if>
    </c:forEach>
  </ul>
</body>
</html>
