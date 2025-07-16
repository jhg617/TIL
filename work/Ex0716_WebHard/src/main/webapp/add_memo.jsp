<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //요청시 한글처리
    request.setCharacterEncoding("utf-8");

    // 전달되어 오는 파라미터들 받기(writer, content)
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");
    String ip = request.getRemoteAddr();

    int cnt = MemoDAO.add(writer, content, ip);
    //위 cnt는 저장된 레코드의 수를 저장한다.

    // 강제로 페이지 이동
    response.sendRedirect("memoList.jsp?cmd="+cnt);

%>


