<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("m_name", "홍길동");

    //Map구조 생성
    HashMap<String, String> map = new HashMap<>();
    map.put("cPage", "3");

    request.setAttribute("m_map", map);
%>
    <jsp:forward page="ex2_2.jsp">
        <jsp:param name="v1" value="2000"/>
        <jsp:param name="v2" value="3000"/>
    </jsp:forward> <%--request 값 같이 넘어감. 어디로? ex2_2.jsp로--%>
</body>
</html>
