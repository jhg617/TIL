<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean class="shop.bean.Cart" id="cart" scope="session"/> <%--재사용--%>
<%
  String pnum = request.getParameter("p_num"); //파라미터 가져와서 저장
  if(pnum != null)
    cart.delProduct(pnum);

  response.sendRedirect("cartList.jsp?prod_num="+pnum);
%>