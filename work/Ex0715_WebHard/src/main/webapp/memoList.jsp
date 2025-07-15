<%@ page import="java.util.List" %>
<%@ page import="mybatis.vo.MemoVO" %>
<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page import="mybatis.vo.MemVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">

  <style>
    #list_table{
      border-collapse: collapse;
      width: 400px;
    }
    #list_table th, #list_table td{
      border: 1px solid #27a;
      padding: 3px;
    }
    #list_table thead th{
      background: #5ad;
      color: #fff;
    }
    #list_table caption{
      font-size: 30px;
      font-weight: bold;
      padding-bottom: 20px;
    }

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

    .txt_center{
      text-align: center;
      height: 50px;
    }

    .show{
      display: block;
    }

    #list_table thead tr:first-child td{
      border: none;
    }

    #writer{
      background-color: #dedede;
      border: 1px solid #ababab;
    }
    #cmd_win{
      display: none;
    }
  </style>
</head>
<body>
<%
  //index.jsp에서 현재 페이지로 넘어왔다면 cmd는 null이고,
  // 그렇지 않고 add_memo.jsp에서 왔다면 cmd는 0아니면 1을 가진다.
  String cmd = request.getParameter("cmd");

  //로그인이 되었는지 알아내야 한다.
  Object obj = session.getAttribute("mvo");
  if(obj == null)
    response.sendRedirect("index.jsp");//강제 페이지 이동

  MemVO vo = (MemVO) obj;

  String msg = null;
  if(cmd != null && cmd.equals("1"))
    msg = "저장완료!";
  else if(cmd != null && cmd.equals("0"))
    msg = "저장실패!";
%>
<div id="wrap">
  <table id="list_table">
    <caption>메모 리스트</caption>
    <colgroup>
      <col width="50px">
      <col width="*">
      <col width="80px">
      <col width="90px">
    </colgroup>
    <thead>
    <tr>
      <td colspan="4" >
        <p class="btn">
          <a href="javascript:writeMemo()">
            글쓰기
          </a>
        </p>
      </td>
    </tr>
    <tr>
      <th>번호</th>
      <th>내용</th>
      <th>글쓴이</th>
      <th>등록일</th>
    </tr>
    </thead>
    <tbody>
    <%
      //현재 메모목록을 가져온다.
      List<MemoVO> list = MemoDAO.memoList();

      if(list != null && list.size() > 0){
        //list가 null이 아니고 list.size()가 0보다 크다는 것은
        // memo테이블로부터 가져온 데이터가 있다는 뜻이다. 그래서 반복문 수행해야 함
        for(MemoVO mvo : list){
    %>
        <tr>
          <td><%=mvo.getIdx() %></td>
          <td><%=mvo.getContent() %></td>
          <td><%=mvo.getWriter() %></td>
          <td><%=mvo.getReg_date() %></td>
        </tr>
    <%
        }//for의 끝
      }else{ //memo_t라는 테이블에 데이터가 없을 때
    %>
        <tr>
          <td colspan="4" class="txt_center">
            현재 등록된 데이터가 없습니다.
          </td>
        </tr>
    <%
      }
    %>

    </tbody>
  </table>
</div>


<div id="write_win" title="글쓰기">
  <form action="add_memo.jsp" method="post" name="frm">
    <table>
      <tbody>

      <tr>
        <td><label for="writer">작성자:</label></td>
        <td>
          <input type="text" id="writer"
                 name="writer"
                 value="<%=vo.getM_name() %>" readonly/>
        </td>
      </tr>
      <tr>
        <td><label for="content">내용:</label></td>
        <td>
			<textarea cols="40" rows="6"
                 id="content" name="content"></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <p class="btn">
            <a href="javascript:exe()">
              저장
            </a>
          </p>
        </td>
      </tr>
      </tbody>
    </table>
  </form>
</div>


<div id="cmd_win" title="Message">
  <%=msg%>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>

  $(function (){

    let option = {
      modal: true,
      autoOpen: false,
      title: '메모 추가',
      width: 450,
      height: 280,
      resizable: false,
    };

    $("#write_win").dialog(option);

    <%
      if(msg != null){
    %>
      $("#cmd_win").dialog();
    <%
      }
    %>

  });

  function writeMemo() {
    // 숨겨진 dialog를 보이도록 해야한다.
    $("#write_win").dialog("open");
  }

  function exe() {
    let writer = $("#writer").val().trim();
    let content = $("#content").val().trim();

    if(content.length == 0){
      alert("내용을 입력하세요");
      $("#content").val("");
      $("#content").focus();
      return;
    }

    if(writer.length == 0){
      alert("이름을 입력하세요");
      $("#writer").val("");
      $("#writer").focus();
      return;
    }

    document.frm.submit();
  }
</script>
</body>
</html>










