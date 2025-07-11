<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //요청시 한글처리
  request.setCharacterEncoding("utf-8");

  //파라미터 값들 받기
  String writer = request.getParameter("writer");
  String content = request.getParameter("content");
  String reg_date = request.getParameter("reg_date");
  String ip = request.getRemoteAddr();

  int cnt = MemoDAO.addMemo(writer, content, reg_date, ip);
%>
<script>
  <%
  if(cnt > 0){
  %>
      alert("저장 완료!");
  <%
  } else {
  %>
      alert("저장 실패!");
  <%
  }//if문의 끝
  %>
</script>
</body>
</html>
