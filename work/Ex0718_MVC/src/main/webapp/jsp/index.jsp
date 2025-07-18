<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <style>
    .table{
      width: 600px;
      border-collapse: collapse;
    }
    .table th, .table td{
      border: 1px solid #000;
      padding: 5px;
    }
    .table caption{
      text-indent: -9999px;
      height: 0px;
    }
    .txt_R{ text-align: right; }
    .noBorder{ border: none !important; } /*줄 없애기*/
  </style>
</head>
<body>
  <div id="wrap">
    <header>
      <h1>사원 목록</h1>
    </header>
    <article>
      <table class="table">
        <caption>사원 테이블</caption>
        <thead>
          <tr>
            <td colspan="6" class="txt_R noBorder">
              <%--<button type="button" id="total_btn" onclick="javascript:location.href='Controller?type=total'">전체보기</button>--%>
              <button type="button" id="all_btn">전체(비동기식)</button>
              <button type="button" id="total_btn" onclick="total()">전체보기</button>
              <button type="button" id="search_btn" onclick="search()">검색</button>
              <button type="button" id="add_btn" onclick="javascript:location.href='Controller?type=add'">추가</button>
              <button type="button" id="dept_btn" onclick="dept()">부서목록</button>
            </td>
          </tr>
          <tr>
            <th>사번</th>
            <th>이름</th>
            <th>직종</th>
            <th>급여</th>
            <th>입사일</th>
            <th>부서</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </article>
  </div>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
  <script>
  function total() {
    location.href='Controller?type=total'; //위에 total_btn(전체보기) 버튼 클릭 시 모든 정보를 가져온다.
  }

  function dept() {
    location.href='Controller?type=dept'; //위에 dept_btn(부서목록) 버튼 클릭 시 모든 정보를 가져온다.
  }
  $(function () {

  $("#all_btn").click(function () {
    $.ajax({ //비동기식 통신
      url: "Controller",
      type: "post", //전송방식
      data: {type: "all"}
    }).done(function (res) { //res는 AllAction이 수행된 후
      //응답되는 all.jsp에서 반복수행된 <tr>들이다. 이때 화면에서는 바뀐것처럼 보이지만 사실 index.jsp이다.
      console.log(res);
      $("table.table>tbody").html(res); //비어있던 테이블이 나타나게 된다.
      });
    });
  });

  function search() {
    location.href='Controller?type=search'; //search_btn을 누르면 검색 다이얼로그가 발생
  }
</script>
</body>
</html>
