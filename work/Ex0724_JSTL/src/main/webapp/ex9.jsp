<%@ page import="ex9.vo.TestVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  TestVO t1 = new TestVO("마루치", "010", "maru@korea.com");
  TestVO t2 = new TestVO("아라치", "010", "ara@korea.com");
  TestVO t3 = new TestVO("이도", "010", "lee@korea.com");

  // 위 객체들을 저장할 List 생성
  List<TestVO> list = new ArrayList<>();
  list.add(t1);
  list.add(t2);
  list.add(t3);

  request.setAttribute("list", list);
%>
  <jsp:forward page="ex9_for.jsp"/>

</body>
</html>
