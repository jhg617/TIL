
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8"); //요청시 한글처리
    String u_name = request.getParameter("u_name");
    String b_year = request.getParameter("b_year");
    String age = request.getParameter("age");

    //위의 파라미터들 중 하나라도 못 받았을 때는 폼을 보여준다.
    if(u_name == null || b_year == null || age == null){
%>
    <form action="ex2_1.jsp" method="post">
        이름:<input type="text" name="u_name"/><br/>
        생년:<input type="text" name="b_year"/><br/>
        <button type="button" onclick="send(this.form)">보내기</button>
    </form>
<%
    }else{
%>
      <h2>받은 값:</h2>
      <h3>이름:<%=u_name%></h3>
      <h3>생년:<%=b_year%></h3>
      <h3>나이:<%=age%></h3>
<%
    }
%>
    <script>
      function send(frm) {
        frm.submit();
      }
    </script>
</body>
</html>
