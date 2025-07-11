<%@ page import="mybatis.dao.EmpDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% //스크립트릿 - 변수선언 및 제어문/연산
    //요청시 한글처리
    request.setCharacterEncoding("utf-8");

    //파라미터 값들 받기
    String empno = request.getParameter("empno");
    String ename = request.getParameter("ename");
    String job = request.getParameter("job");
    String hiredate = request.getParameter("hdate");
    String ip = request.getRemoteAddr(); //접속자 ip 얻기

    int cnt = EmpDAO.addEmp(empno, ename, job, hiredate);
%>
<script>
    <%
    if(cnt > 0){ //cnt는 자바변수이므로 스크립트릿을 열어야한다.
    %>
        alert("저장 완료!");
    <%
    }else{
    %>
        alert("저장 실패!");
    <%
    }//if문의 끝
    %>
</script>
</body>
</html>
