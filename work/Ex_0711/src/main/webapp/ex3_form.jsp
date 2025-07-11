<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <article>
      <header>
        <h2>폼 연습</h2>
      </header>
      <div>
        <form action="ex3.jsp" method="post" name="ff">
            <label for="s_id">아이디:</label>
            <input type="text" id="s_id" name="s_id/"><br/>
            <label for="s_pw">비밀번호:</label>
            <input type="password" id="s_pw" name="s_pw/"><br/>
            <button type="button" onclick="exe()">로그인</button>
        </form>
      </div>
    </article>
<script>
  function exe() {
      //유효성 검사 생략
      //document.forms[0].submit();
      document.ff.submit();// 폼의 이름으로 접근하여 보내는 법
  }
</script>
</body>
</html>
