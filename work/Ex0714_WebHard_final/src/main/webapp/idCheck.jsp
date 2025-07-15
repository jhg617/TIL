<%@ page import="mybatis.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("u_id");
    String name = request.getParameter("u_name");
    boolean res = MemberDAO.idCheck(id); //참인지 거짓인지  true이면 1을 넣어준다.
    int chk = 0;
    if(res)
        chk = 1;
%>
<%--받았던 파라미터를 reg.jsp로 보낸다.--%>
<jsp:forward page="reg.jsp">
    <jsp:param name="chk" value="<%=chk%>"/>
</jsp:forward>

<%
/*
    if(MemberDAO.chk(id))
        response.sendRedirect("reg.jsp?m_id="+id+"&chk=1");
    else
        response.sendRedirect("reg.jsp?m_id="+id+"&chk=0");

    */
%>

<%--
<body>
<form action="reg.jsp" method="post">
    <input type="hidden" name="m_id" value="<%=id%>" />
    <input type="hidden" name="chk" value="<%=id%>" />
    <input type="hidden" name="m_name" value="<%=name%>" />
</form>
<script>
    $(function () {
        document.forms[0].submit();
    });
</script>
</body>--%>