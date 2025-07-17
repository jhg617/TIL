<%@ page import="mybatis.vo.MemoVO" %>
<%@ page import="java.util.List" %>
<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    #table{
      width: 600px;
      border-collapse: collapse;
    }
    #table th, #table td{
      border: 1px solid #000;
      padding: 5px;
    }
    #table caption{ text-indent: -9999px; }
  </style>
</head>
<body>
  <div id="wrap">
    <header>
      <h2>메모목록</h2>
    </header>
    <article>
      <table id="table">
        <caption>부서목록 테이블</caption>
        <thead>
        <tr>
          <th>번호</th>
          <th>작성자</th>
          <th>내용</th>
          <th>작성일</th>
          <th>IP</th>
        </tr>
        </thead>
        <tbody>
          <%
            Object obj = request.getAttribute("memo");
            MemoVO[] ar = null;
            if(obj != null){
              ar = (MemoVO[]) obj;
              for(MemoVO mvo : ar){
          %>
            <tr>
              <td><%=mvo.getIdx()%></td>
              <td><%=mvo.getWriter()%></td>
              <td><%=mvo.getContent()%></td>
              <td><%=mvo.getReg_date()%></td>
              <td><%=mvo.getIp()%></td>
            </tr>
          <%
              }//for의 끝
            }
          %>
        </tbody>
      </table>
    </article>
  </div>
</body>
</html>
