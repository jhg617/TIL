<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>JSP 첫 예제</h2>
  <hr/> <%--실선--%>
  <h3>1. 스크립트요소</h3>
  <ol>
    <li>선언문:</li>
    <li>출력문:</li>
    <li>스크립트릿:</li>
  </ol>
  <p>스크립트요소는 각 문들이 겹쳐서 사용할 수 없다.</p>
  <%! //선언문 정의---------------
    String msg = "쌍용교육센터"; //멤버변수
    int value = 10000;

    public String test(){
      LocalDate now = LocalDate.now(); //날짜만 얻기
      return msg+":"+now.toString();
    }
  %>

  <h1><%=msg%>,<%=value%></h1> <%--출력문--%>
  <h1><%=test()%></h1>
</body>
</html>
