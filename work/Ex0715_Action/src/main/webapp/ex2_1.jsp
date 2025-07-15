<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
  // 나이를 구하기 위해 현재년도를 구하자
  LocalDate now = LocalDate.now();
  int cYear = now.getYear();

  String b_year = request.getParameter("b_year");
  int bYear = Integer.parseInt(b_year);
  int age = cYear - bYear; //현재년도 - 전달받은 인자(b_year)
%>
<jsp:forward page="ex2.jsp">
  <jsp:param name="age" value="<%=age%>"/>
</jsp:forward>