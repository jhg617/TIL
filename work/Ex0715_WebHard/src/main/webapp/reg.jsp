<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">

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
    .success{ color: #00f; font-weight: bold; font-size: 11px; }
    .fail{ color: #f00; font-weight: bold; font-size: 11px; }

    div#my_alert{ display: none; }
  </style>
</head>
<body>

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
            <input type="text" id="u_id" name="u_id"/>
            <%--<button type="button" id="chk_btn" onclick="chkID()">중복확인</button>--%>
            <div id="box"><%--사용가능 또는 사용불가 --%></div>
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

  <div id="my_alert" title="경고">
    <p id="str"></p>
    <p class="btn">
      <a href="javascript:closed()">닫기</a>
    </p>
  </div>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script> <%--jquery 밑에 jqueryUI 스크립트가 와야함!!!--%>
  <script>
    $(function (){
      // 아이디를 입력하는 입력란에서 키보드를 누를 때마다 이벤트 발생
      $("#u_id").bind("keyup", function (){ //keyup: 키보드입력을 할때마다 값을 불러옴
        //사용자가 입력한 아이디가 u_id에 입력되므로
        // 그곳에 있는 값(value)을 가져온다.
        let str = $("#u_id").val();
        //console.log(str);

        //str의 값에서 공백이 있는지? 없는지? 판단하고 유효성 검사를 해야 함! 패스~~

        //입력한 문자열의 길이가 4자이상일 때 비동기식 통신을 수행한다.
        if(str.trim().length > 3){
          // jQuery비동기식 통신 수행
          $.ajax({
            url: "idCheck.jsp",
            type: "post",
            data: {u_id: str.trim()} //json 표기법
          }).done(function (result){
            //요청에 성공했을 때
            $("#box").html(result);
          });
        }else
          $("#box").html("");
      });
    });
    function send() {
      // 아이디,비밀번호, 이름을 입력했는지? 유효성 검사
      let mId = $("#u_id").val().trim();
      let mPw = $("#u_pw").val().trim();
      let mName = $("#u_name").val().trim();

      let chk = $("#chk").hasClass("success"); //chk에 #chk가 있으면 들어온다.
      if(!chk){
        $("#str").html("아이디 체크하쇼");
        $("#my_alert").dialog();
        return;
      }

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
      //---- 비동기식 통신 ----------//
      $.ajax({
        url: "idCheck.jsp", // 호출할 서버경로
        type: "post", //요청방식(타입)
        data: "u_id="+encodeURIComponent(mId),//전달하고자 할 파라미터(파라미터에 한글이 포함되어 있을경우 encode)
      }).done(function (result){
        //요청에 성공했을 때 자동으로 수행하는 곳 -> 익명함수로 함수를 지정한다.
        $("#box").html(result.trim());
      }).fail(function (err){
        //요청에 실패했을 때 자동으로 수행하는 곳
        console.log(err);
      });
    }
  </script>
</body>
</html>
