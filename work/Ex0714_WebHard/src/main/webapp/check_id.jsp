<%@ page import="mybatis.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //파라미터로 받기
  String mId = request.getParameter("u_id");

  if(MemberDAO.checkId())

    if(MemberDAO.checkId(id))
        response.sendRedirect("reg.jsp?m_id="+"&chk=1");
    else
        response.sendRedirect("reg.jsp?m_id="+"&chk=0");
%>

<%--reg.jsp?m_id=test&chk=1 사용가능--%>
<%--reg.jsp?m_id=test&chk=0 사용불가--%>