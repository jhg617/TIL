<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //요청시 한글처리
  request.setCharacterEncoding("utf-8");

  //전달되어 오는 파라미터 값들 받기
  String writer = request.getParameter("writer");
  String content = request.getParameter("content");
  String ip = request.getRemoteAddr(); //ip얻기

  int cnt = MemoDAO.addMemo(writer, content, ip);
  //위 cnt는 저장된 레코드의 수를 저장한다.

  // 강제로 페이지 이동
  response.sendRedirect("memoList.jsp?cmd=1&test=111"+cnt); //Get방식으로 memoList.jsp로 이동 (? 기준 왼쪽은 경로, 오른쪽은 인자)
%>
</script>
