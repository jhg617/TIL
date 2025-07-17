<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean class="shop.bean.ShopBean" id="sb" scope="session"/> <%--재사용--%>
<jsp:useBean class="shop.bean.Cart" id="cart" scope="session"/> <%--재사용--%>
<%
  String pnum = request.getParameter("p_num"); //파라미터 가져와서 저장
  String count = request.getParameter("count");
  if(pnum != null && count != null){

    int q = Integer.parseInt(count); //정수형
    if(q < 1)
      cart.delProduct(pnum); //숫자가 0이기 때문에 삭제한다.
    else
      cart.changeCount(pnum, q); //수량변경
  }

  response.sendRedirect("cartList.jsp");
%>