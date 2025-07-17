<%@ page import="mybatis.vo.DeptVO" %>
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
      <h2>부서목록</h2>
    </header>
    <article>
      <table id="table">
        <caption>부서목록 테이블</caption>
        <thead>
        <tr>
          <th>부서코드</th>
          <th>부서명</th>
          <th>도시코드</th>
        </tr>
        </thead>
        <tbody>
          <%
            // request에 emp라는 이름으로 저장된 객체를 가져온다.
            Object obj = request.getAttribute("dept");

            DeptVO[] ar = null;
            if(obj != null){
              ar = (DeptVO[]) obj;
              for(DeptVO dvo : ar){
          %>
            <tr>
              <td><%=dvo.getDeptno()%></td>
              <td><%=dvo.getDname()%></td>
              <td><%=dvo.getLoc_code()%></td>
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
