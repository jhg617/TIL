<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%--<c:set var="now" value="<%=new Date(System.currentTimeMillis())%>"/>--%>
    <c:set var="now2" value="<%=new Date()%>"/> <%--년/월/일만 확인하려면 sql의 Date()함수 사용--%>
    <h2>${now}</h2>
    <h2><fmt:formatDate value="${now2}" pattern="yyyy-MM-dd"/> </h2> <%--날짜포맷(년/월/일)--%>
    <h2><fmt:formatDate value="${now2}" pattern="(a)hh:mm:ss"/> </h2> <%--시간포맷(시/분/초)--%>
    <h2><fmt:formatDate value="${now2}" pattern="HH:mm:ss"/> </h2> <%--24(시/분/초)--%>
    <hr/>
    <h2>----------- 숫자형식 ---------</h2>
    <h2><fmt:formatNumber value="1200000000"/></h2> <%-- , 찍힘--%>
    <h2><fmt:formatNumber value="1200000000" groupingUsed="false"/></h2> <%-- , 안 찍힌다.--%>
    <h2><fmt:formatNumber value="00001200000000" pattern="#,##0"/></h2> <%--앞의 0은 의미가 없는 0 제외--%>
    <h2><fmt:formatNumber value="00001200000000" pattern="#,###.00"/></h2> <%--소수점--%>
    <h2><fmt:formatNumber value="0.195" type="percent" pattern="0.00%"/></h2> <%--백분율--%>
    <h2><fmt:formatNumber value="10000000000" type="currency"
                          currencySymbol="$"/></h2> <%--화폐단위--%>
</body>
</html>
