<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
    <form action="ex1.jsp" method="post">
        ID:<input type="text" name="m_id"/><br/>
        PW:<input type="password" name="m_pw"/><br/>
        Name:<input type="text" name="m_name"/><br/>
        <button type="button" onclick="exe(this.form)">로그인</button>
    </form>
<script>
    function exe(frm) {
        frm.submit();
    }
</script>
</body>
</html>