
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //요청시 한글처리
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="pvo" class="test.vo.ParamVO" scope="session"/> <%--scope 종류: page,session 등--%>
<%--  ParamVO pvo = new ParamVO(); 와 같은 것이다.  --%>
<%--<jsp:setProperty name="pvo" property="s_name" param="s_name"/>--%> <%--setProperty: 멤버변수 할당, property와 param이 같으면 생략 가능--%>
<jsp:setProperty name="pvo" property="*" /> <%--넘어오는 파라미터 갯수만큼만 채운다.--%>

  <h3><%=pvo.getS_name()%></h3>
  <h3><%=pvo.getS_email()%></h3>
  <h3><%=pvo.getS_age()%></h3>
  <button tyope="button" onclick="javascript:location.href='ex3_2.jsp'">다음페이지</button> <%--함수 호출없이 자바스크립트 문법으로 페이지 이동--%>
</body>
</html>
