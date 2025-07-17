<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>페이지1</h1>
    <%-- request에 v1이라는 이름으로 저장한 값 출력하자 --%>
    <%--<% String v1 = (String) request.getAttribute("v1")%>
    <h2><%=v1%></h2>--%>
    <h2>${v1}</h2> <%--el사용, 일반적으로는 지정을 해주지만 실무에서는 이런식으로 많이 쓴다.--%>
</body>
</html>
