<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- JSTL로 변수 선언 --%>
<c:set var="res" value="10" scope="page"/>
<%-- int res = 10; 와 같다--%>

<c:forEach begin="1" end="${res}" varStatus="vs"> <%--여기선 i라는 개념이 없다.
                                                    그래서 그 역할을 하는 varStatus는 선언해준다.--%>
  <h3>${vs.index}</h3>                              <%--그리고 vs안의 index을 가져와야한다--%>
</c:forEach>
</body>
</html>
