<%@ page import="mybatis.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("u_id");

    if(MemberDAO.idCheck(id))
        response.sendRedirect("reg.jsp?m_id="+id+"&chk=1");
    else
        response.sendRedirect("reg.jsp?m_id="+id+"&chk=0");
%>
