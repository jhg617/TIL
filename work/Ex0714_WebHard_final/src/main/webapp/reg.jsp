<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    .btn{
      width: 70px;
      height: 20px;
      text-align: center;
      padding:0px;
    }
    .btn a{
      display: block;
      width: 100%;
      padding: 4px;
      height: 20px;
      line-height: 20px;
      background: #27a;
      color: #fff;
      border-radius: 3px;
      text-decoration: none;
      font-size: 12px;
      font-weight: bold;
    }
    .btn a:hover{
      background: #fff;
      color: #27a;
      border: 1px solid #27a;
    }

    #s_id, #s_pw{
      width: 80px;
      border: 1px solid #27a;
      border-radius: 3px;
      padding: 4px;
    }
    div#log_fail, div#log_suc{
      width: 170px;
      border: 1px solid #27a;
      border-radius: 3px;
    }
    .hide{ display: none; }
    .show{ display: block; }

    div#box{
      display: inline-block;
      width: 65px;
      height: 20px;
      padding: 0;
      margin: 0;
      margin-left: 3px;
    }
  </style>
</head>
<body>
<%
  String m_id = request.getParameter("m_id");
  String chk = request.getParameter("chk");
%>
  <article>
    <header>
      <h2>회원가입</h2>
    </header>
    <div>
      <form>
      <table>
        <caption>회원가입 테이블</caption>
        <tbody>
        <tr>
          <td><label for="u_id">아이디:</label></td>
          <td>
            <input type="text" id="u_id" name="u_id" value="<%if(m_id != null) out.print(m_id);%>"/>
            <button type="button" id="chk_btn" onclick="chkID()">중복확인</button>
            <div id="box"><%--사용가능 또는 사용불가 --%>
            <%
              if(chk!=null && chk.equals("1"))
                out.print("사용가능");
              else if(chk!=null && chk.equals("0"))
                out.print("사용불가");
            %>
            </div>
          </td>
        </tr>
        <tr>
          <td><label for="u_pw">비밀번호:</label></td>
          <td>
            <input type="password" id="u_pw" name="u_pw"/>
          </td>
        </tr>
        <tr>
          <td><label for="u_name">이름:</label></td>
          <td>
            <input type="text" id="u_name" name="u_name"/>
          </td>
        </tr>
        <tr>
          <td><label for="u_phone">연락처:</label></td>
          <td>
            <select id="u_phone" name="u_phone">
              <option value="02">02</option>
              <option value="010">010</option>
              <option value="012">012</option>
              <option value="017">017</option>
            </select>
            <label for="u_phone2">-</label>
            <input type="text" id="u_phone2" name="u_phone"/>
            <label for="u_phone3">-</label>
            <input type="text" id="u_phone3" name="u_phone"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <p class="btn">
              <a href="javascript:send()">
                저장
              </a>
            </p>
          </td>
        </tr>
        </tbody>
      </table>
      </form>
    </div>
  </article>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script>
    function send() {
      // 아이디,비밀번호, 이름을 입력했는지? 유효성 검사
      let mId = $("#u_id").val().trim();
      let mPw = $("#u_pw").val().trim();
      let mName = $("#u_name").val().trim();

      if(mId.length == 0){
        alert("아이디를 입력하세요");
        $("#u_id").val("");
        $("#u_id").focus();
        return;
      }
      if(mPw.length == 0){
        alert("비밀번호를 입력하세요");
        $("#u_pw").val("");
        $("#u_pw").focus();
        return;
      }
      if(mName.length == 0){
        alert("이름을 입력하세요");
        $("#u_name").val("");
        $("#u_name").focus();
        return;
      }
      let frm = document.forms[0];// 현재문서에서 첫번째 폼객체
      frm.action = "regMember.jsp";
      frm.method = "post";
      frm.submit();//서버로 보낸다.
    }

    function chkID() {
      let mId = $("#u_id").val().trim();

      if(mId.length == 0){
        alert("아이디를 입력하세요");
        $("#u_id").val("");
        $("#u_id").focus();
        return;
      }
      location.href="idCheck.jsp?u_id="+mId;
    }
  </script>
</body>
</html>
