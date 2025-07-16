<%@ page import="mybatis.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("u_id");

    if(MemberDAO.idCheck(id)){
%>
    <p id="chk" class="success">사용가능</p>
<%
    }else{
%>
    <p id="chk" class="fail">사용불가</p>
<%
    }
%>

