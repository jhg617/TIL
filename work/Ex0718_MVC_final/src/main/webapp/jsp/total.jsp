<%@ page import="mybatis.vo.EmpVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        .noBorder{ border: none !important; }
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
                    <button type="button" id="total_btn">전체보기</button>
                    <button type="button" id="search_btn">검색</button>
                    <button type="button" id="add_btn" onclick="javascript:location.href='Controller?type=add'">추가</button>
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
            <%
                Object obj = request.getAttribute("ar");
                if(obj != null){
                    EmpVO[] ar = (EmpVO[]) obj;
                    for(EmpVO vo : ar){
            %>
                <tr>
                    <td><%=vo.getEmpno()%></td>
                    <td><%=vo.getEname()%></td>
                    <td><%=vo.getJob()%></td>
                    <td><%=vo.getSal()%></td>
                    <td><%=vo.getHiredate()%></td>
                    <td><%=vo.getDeptno()%></td>
                </tr>
            <%
                    }//for의 끝
                }else{
            %>
                <tr>
                    <td colspan="6">
                        현재 등록된 정보가 없습니다.
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </article>
</div>
</body>
</html>
