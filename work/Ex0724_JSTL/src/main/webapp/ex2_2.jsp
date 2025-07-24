<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>전달된 값들</h1>
  <h2>파라미터 v1: ${v1}</h2> <%--결과 안나옴--%>
  <h2>파라미터 v1: ${param.v1}</h2> <%--결과 나옴, 파라미터는 앞에 param을 꼭 붙여야한다.--%>
  <h2>m_name: ${m_name}</h2>
  <h2>m_name: ${requestScope.m_name}</h2>
  <h2>cPage: ${cPage}</h2> <%--map에 저장안되어 있기때문에 출력안된다.--%>
  <h2>request에 m_map이라는 이름으로 저장된 cPage: ${cPage}
    ${requestScope.m_map.cPage}</h2>
</body>
</html>
