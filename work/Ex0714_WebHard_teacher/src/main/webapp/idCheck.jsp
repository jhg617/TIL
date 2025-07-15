<%@ page import="mybatis.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("u_id");
    boolean res = MemberDAO.idCheck(id);
    int chk = 0;
    if(res)
        chk = 1;
/*
    if(MemberDAO.idCheck(id))
        response.sendRedirect("reg.jsp?m_id="+id+"&chk=1");
    else
        response.sendRedirect("reg.jsp?m_id="+id+"&chk=0");
 */
%>
<jsp:forward page="reg.jsp">
    <jsp:param name="chk" value="<%=chk%>"/>
</jsp:forward>
