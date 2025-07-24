<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>JSTL연습</h1>
    <c:set var="cnt" value="10" scope="page"/>
    <c:set var="str" value="<strong>쌍용교육센터</strong>" scope="page"/>

    <ul>
      <c:forEach begin="1" end="${cnt}" varStatus="vs">
        <li>
          ${vs.index} /
          <c:out value="${vs.index+1}"/> /
              ${str} /
          <c:out value="${str}"/> /
          <c:out value="${str}" escapeXml="false"/>
        </li>
      </c:forEach>
    </ul>
</body>
</html>
