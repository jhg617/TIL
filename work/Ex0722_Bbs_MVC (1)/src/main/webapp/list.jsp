<%@ page import="mybatis.vo.BbsVO" %>
<%@ page import="bbs.util.Paging" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style type="text/css">
    #bbs table {
      width:580px;
      margin-left:10px;
      border:1px solid black;
      border-collapse:collapse;
      font-size:14px;

    }

    #bbs table caption {
      font-size:20px;
      font-weight:bold;
      margin-bottom:10px;
    }

    #bbs table th,#bbs table td {
      text-align:center;
      border:1px solid black;
      padding:4px 10px;
    }

    .no {width:15%}
    .subject {width:30%}
    .writer {width:20%}
    .reg {width:20%}
    .hit {width:15%}
    .title{background:lightsteelblue}

    .odd {background:silver}

    /* paging */

    table tfoot ol.paging {
      list-style:none;
    }

    table tfoot ol.paging li {
      float:left;
      margin-right:8px;
    }

    table tfoot ol.paging li a {
      display:block;
      padding:3px 7px;
      border:1px solid #00B3DC;
      color:#2f313e;
      font-weight:bold;
    }

    table tfoot ol.paging li a:hover {
      background:#00B3DC;
      color:white;
      font-weight:bold;
    }

    .disable {
      padding:3px 7px;
      border:1px solid silver;
      color:silver;
    }

    .now {
      padding:3px 7px;
      border:1px solid #ff4aa5;
      background:#ff4aa5;
      color:white;
      font-weight:bold;
    }

  </style>
</head>
<body>
<div id="bbs">
  <table summary="게시판 목록">
    <caption>게시판 목록</caption>
    <thead>
    <tr class="title">
      <th class="no">번호</th>
      <th class="subject">제목</th>
      <th class="writer">글쓴이</th>
      <th class="reg">날짜</th>
      <th class="hit">조회수</th>
    </tr>
    </thead>

    <tfoot>
    <tr>
      <td colspan="4">
        <ol class="paging">
<%
Object obj1 = request.getAttribute("page");
if(obj1 != null){
    Paging p = (Paging)obj1;

    // 만약 page가 가지고 있는 startPage가 1이면
    // 이전 기능을 부여하면 안된다.
    if(p.getStartPage() < p.getPagePerBlock()){
%>
        <li class="disable">&lt;</li>
<%
    }else{
%>
          <li><a href="Controller?type=list&cPage=<%=p.getNowPage()-p.getPagePerBlock()%>">&lt;</a></li>
<%
    }//if문의 끝
    int startPage = p.getStartPage();
    int endPage = p.getEndPage();
    for(int i = startPage; i<=endPage; i++){
%>
          <li <% if(p.getNowPage() == i){ %>class="now" <% }%>><%=i%></li>
<%
    }//for의 끝

    if(p.getEndPage() < p.getTotalPage()){
%>
        <li><a href="Controller?type=list&cPage=<%=p.getNowPage()+p.getPagePerBlock()%>">&gt;</a></li>
<%
    }else{
%>
        <li class="disable">&gt;</li>
<%
    }
  }


%>


        </ol>
      </td>
      <td>
        <input type="button" value="글쓰기"
           onclick="javascript:location.href='Controller?type=write'"/>
      </td>
    </tr>
    </tfoot>
    <tbody>
<%
  Object obj = request.getAttribute("ar");
  if(obj != null){
    BbsVO[] ar = (BbsVO[]) obj;
    for(BbsVO vo:ar){
%>
    <tr>
      <td><%=vo.getB_idx()%></td>
      <td style="text-align: left">
        <a href="#">
          <%=vo.getSubject()%>
        </a></td>
      <td><%=vo.getWriter()%></td>
      <td><%=vo.getWrite_date()%></td>
      <td><%=vo.getHit()%></td>
    </tr>
<%
    }//for의 끝
  }
%>
    </tbody>
  </table>

</div>
</body>
</html>

