
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="ex3_1.jsp" method="post">
    이름:<input type="text" name="s_name"/><br/>
    나이:<input type="text" name="s_age"/><br/>
    이메일:<input type="text" name="s_email"/><br/>
    <button type="button" onclick="exe(this.form)">저장</button>
  </form>
<script>
  function exe(frm) {
    frm.submit();
  }
</script>
</body>
</html>
