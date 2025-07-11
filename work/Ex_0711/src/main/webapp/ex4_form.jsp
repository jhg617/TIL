<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <article>
        <header>
          <h2>구구단 폼</h2>
        </header>
        <div>
          <form action="ex4.jsp" method="post" name="frm">
            <label for="s_num">숫자입력:</label>
            <input type="text" id="s_num" name="s_num"><br/> <%--서버로 보낼땐 name으로!--%>
            <button type="button" onclick="send_btn()">보내기</button>
          </form>
        </div>
    </article>
<script>
  function send_btn() {
    let num = document.getElementById("s_num");
    if(num.value.trim().length == 0){
      alert("숫자를 입력하세요");
      num.value = "";
      num.focus();
      return;
    }
    //숫자인지? 아닌지? 판단해야 함!
      if(isNaN(num)) { //숫자일때
          alert("숫자를 입력하세요");
      } else { //숫자가 아닐때
        //************ 수정 필요 **************
      }
      document.frm.submit(); //폼의 name으로 제출
    //document.forms[0].submit();
  }
</script>
</body>
</html>
