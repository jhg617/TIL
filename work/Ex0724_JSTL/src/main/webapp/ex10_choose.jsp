<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
  현재페이지는 money라는 파라미터를 받는다.
  money에 따라 과일을 선택할 수 있다.
  사과: 100
  배 : 1700
  샤인머스캣 : 2500
--%>
  <c:choose> <%--choose는 else-if의 역할을 한다! --%>
    <c:when test="${param.money >= 2500}">
      사과, 배, 샤인머스캣 중 하나를 선택!
    </c:when>
    <c:when test="${param.money >= 1700}">
      사과, 배 중 하나를 선택!
    </c:when>
    <c:when test="${param.money >= 100}">
      사과 선택!
    </c:when>
    <c:otherwise>선택할 수 있는 과일이 없습니다.</c:otherwise>
  </c:choose>
    <hr/>
    <c:if test="${param.money >= 2500}">
      사과, 배, 샤인머스캣 중 하나를 선택!
    </c:if>
    <c:if test="${param.money >= 1700}">
      사과, 배 중 하나를 선택!
    </c:if>
    <c:if test="${param.money >= 100}">
      사과 선택!
    </c:if>
    <c:if test="${param.money < 100}">
      선택할 수 있는 과일이 없습니다.
    </c:if>
</body>
</html>
