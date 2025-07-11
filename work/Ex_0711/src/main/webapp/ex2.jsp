<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    int cnt = 10; //멤버변수
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>스크립트 요소: 스크립트릿 연습</h1>
    <p>스크립트 릿은 자바의 제어문과 연산식 등을 기술한다.</p>
    <ul>
    <% for(int i=0; i<cnt; i++){ %> <%--스크립트 요소1(자바코드)--%>
        <li><%=(i+1)%></li>
    <% } %>  <%--스크립트 요소2(자바코드)--%>
    </ul>
</body>
</html>
