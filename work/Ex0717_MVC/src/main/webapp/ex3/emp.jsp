<%@ page import="mybatis.vo.EmpVO" %>
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
      <h2>사원목록</h2>
    </header>
    <article>
      <table id="table">
        <caption>사원목록 테이블</caption>
        <thead>
        <tr>
          <th>사번</th>
          <th>이름</th>
          <th>직종</th>
          <th>부서코드</th>
        </tr>
        </thead>
        <tbody>
        <%
          // request에 emp라는 이름으로 저장된 객체를 가져온다.
          Object obj = request.getAttribute("emp");

          EmpVO[] ar = null;
          if(obj != null){
            ar = (EmpVO[]) obj;
            for(EmpVO vo : ar){
        %>
          <tr>
            <td><%=vo.getEmpno()%></td>
            <td><%=vo.getEname()%></td>
            <td><%=vo.getJob()%></td>
            <td><%=vo.getDeptno()%></td>
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
