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
    #search_dig table, #search_dig td {
      border: none;
    }
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
              <button type="button" id="search_btn">검색</button>
              <button type="button" id="add_btn" onclick="javascript:location.href='Controller?type=add'">추가</button>
              <button type="button" id="dept_btn" onclick="dept()">부서목록</button>
              <%--*.add--%>
                <div id="search_dig" title="사원 검색", style="display: none">
                  <form action="Controller" method="post" name="frm">
                    <table>
                      <caption>검색 테이블</caption>
                      <tbody>
                      <tr>
                        <td>
                          <select id="searchType" name="searchType">
                            <option value="0">사번</option>
                            <option value="1">이름</option>
                            <option value="2">직종</option>
                            <option value="3">부서코드</option>
                          </select>
                        </td>
                        <td>
                          <input type="text" id="searchValue"
                                 name="searchValue"/>
                        </td>
                      </tr>
                      </tbody>
                      <tfoot>
                      <tr>
                        <td colspan="2">
                          <button type="button" id="send_btn" class="btn">검색</button>
                        </td>
                      </tr>
                      </tfoot>
                    </table>
                  </form>
                </div>
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
        <tbody>

        </tbody>
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

  /*function search() {
    $("#search_dig").dialog("open");
  }*/
  //const CONTEXT_PATH = "${pageContext.request.contextPath}";

  $(function () {

    //다이얼로그 옵션을 객체로 정의
    let option = {
      modal: true,
      autoOpen: false,
      title: "사원 검색",
      resizable: false,
    };

  // 다이얼로그 초기화 코드
    $("#search_dig").dialog(option);

    //검색 버튼 눌렀을때 다이얼로기 열림
    $("#search_btn").click(function() {
      $("#search_dig").dialog("open");
    });
  // 전체(비동기식) 버튼 클릭 이벤트
  $("#all_btn").click(function () {
    $.ajax({ //비동기식 통신
      url: "Controller",
      type: "post", //전송방식
      data: {
        type: "all"
      }
    }).done(function (res) { //res는 AllAction이 수행된 후
      //응답되는 all.jsp에서 반복수행된 <tr>들이다. 이때 화면에서는 바뀐것처럼 보이지만 사실 index.jsp이다.
      //console.log(res);
      $("table.table>tbody").html(res); //비어있던 테이블이 나타나게 된다.
      });
    });

    // 다이얼로그 안의 검색 버튼 이벤트
    /*$("#search_btn2").click(function () {
        let searchType = $("#searchType").val();
        let searchValue = $("#searchValue").val();

      $.ajax({
        url: CONTEXT_PATH + "/Controller",
        type: "post",
        data: {type: "search",
              searchType: searchType,
              searchValue: searchValue
        }
      }).done(function (res) {
        $("table.table>tbody").html(res);
        $("#search_dig").dialog("close"); //검색 후 다이얼로그 닫기
      });
    });*/
  });
  //************* 250721 수정 ************
  $("#send_btn").click(function (){
    //유효성 검사
    let value = $("#searchValue").val().trim();
    if(value.length == 0){
      alert("검색할 단어를 입력하세요");
      $("#searchValue").val("");
      $("#searchValue").focus();
      return;
    }

    // 비동기식 통신 준비
    $.ajax({
      url: "Controller",
      type: "post",
      data: {
        type: 'search',
        searchType: $("#searchType").val(),
        searchValue: value
      }
    }).done(function (res){ //<tr> 반복처리된 내용 res에 저장됨
      $("table.table>tbody").html(res);
      $("#search_dig").dialog("close");
    });
  });

  /*function search() {
    $("#search_dig").dialog("open"); // 검색 버튼 누르면 다이얼로그 열림
  }

  let option = {
    modal: true,
    autoOpen: false,
    title: '사번검색',
    resizable: false,
  };

  $("#search_dig").dialog(option); //다이얼로그 창 등록*/

</script>
</body>
</html>
