<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%--함수사요 lib--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
  현재 페이지는 str이라는 파라미터가 넘어온다.
  받은 값의 길이를 알아내자!
--%>
  <h2>str파라미터 값: ${param.str}</h2>
  <h2>str의 길이: ${param.str.length()}</h2>
  <h2>str.substring(0,3): ${param.str.substring(0,3)}</h2>
  <h2>str.indexOf("k"): ${param.str.indexOf("k")}</h2> <%--인덱스번호--%>
  <h2>str.replace("k", "c"): ${param.str.replace("k", "c")}</h2> <%--k를 c로 변경--%>
<hr/>
  <%-- JSTL변수 선언--%>
  <c:set var="s1" value="${param.str}"/>
  <h2>fn:length(s1): ${fn:length(s1)}</h2> <%--line 14랑 똑같다.--%>
  <h2>fn:substring(s1,0,3): ${fn:substring(s1, 0, 3)}</h2> <%--s1의 0번지에서 3번지--%>
  <h2>fn:indexOf(s1,"k"): ${fn:indexOf(s1, "k")}</h2>
  <h2>fn:replace(s1,"k","c"): ${fn:replace(s1, "k", "c")}</h2> <%--s1의 "k"를 "c"로 변경--%>
  <h2>fn:toUpperCase(s1): ${fn:toUpperCase(s1)}</h2> <%--s1의 대문자로 변경--%>
</body>
</html>
