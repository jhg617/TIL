<%@ page import="mybatis.vo.MemVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <style>
        .btn{
            width: 70px;
            height: 20px;
            text-align: center;
            padding:0px;

        }
        .inli{
            display: inline-block;
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
    </style>
</head>
<body>
<%
    String mode = request.getParameter("mode");
    //HttpSession객체가 session이라는 이름으로 이미 생성되어 제공되고 있다.
    //이런 HttpSession은 브라우저를 닫을 때까지 사용가능함!
    // 세션에 "mvo"라는 이름으로 저장된 것이 있다면 로그인을 한 상태로 인지하자!
    // 먼저 세션으로부터 "mvo"라는 이름으로 저장된 객체를 얻어내어
    // Object형 변수 obj에 저장하자!
    Object obj = session.getAttribute("mvo");
    if(obj == null){
%>
<div id="log_fail" class="show">

    <form action="" method="post">
        <table>
            <colgroup>
                <col width="50px"/>
                <col width="*"/>
            </colgroup>
            <tbody>
            <tr>
                <td><label for="s_id">ID:</label></td>
                <td>
                    <input type="text" id="s_id" name="u_id"/>
                </td>
            </tr>
            <tr>
                <td><label for="s_pw">PW:</label></td>
                <td>
                    <input type="password" id="s_pw" name="u_pw"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p class="btn inli">
                        <a href="javascript:exe()">
                            로그인
                        </a>
                    </p>
                    &nbsp;
                    <p class="btn inli">
                        <a href="reg.jsp">
                            회원가입
                        </a>
                    </p>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<%
    }else{
        //obj가  null이 아닐 경우다.
        // 이름을 얻기 위해 Object형으로 두면 안되고, MemVO로 형변환을 해야
        // 이름을 얻을 수 있다.
        MemVO mvo = (MemVO) obj;
%>
<div id="log_suc" class="show">

    <p>(<%=mvo.getM_name() %>)님 환영</p>
    <p class="btn">
        <a href="logout.jsp">로그아웃</a>
    </p>
    <p class="btn">
        <a href="memoList.jsp">메모장</a>
    </p>
    <p class="btn">
        <a href="disk/myDisk.jsp">마이디스크</a>
    </p>
</div>
<%
    }//if문의 끝
%>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    function exe(){
        var id = $("#s_id");
        var pw = $("#s_pw");

        if(id.val().trim().length <= 0){
            alert("아이디를 입력하세요!");
            id.focus();
            return;
        }
        if(pw.val().trim().length <= 0){
            alert("비밀번호를 입력하세요!");
            pw.focus();
            return;
        }
        //요청할 서버경로를 변경한다.
        document.forms[0].action = "login.jsp";
        document.forms[0].submit();//서버로 보내기
    }
</script>
</body>
</html>




