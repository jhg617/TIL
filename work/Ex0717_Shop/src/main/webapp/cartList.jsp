<%@ page import="mybatis.vo.ProductVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<div id="wrap">
<header>
  <jsp:include page="./menu.jsp"/>
</header>
<%--
ShopBean이라는 빈을 재 사용하자!
앞서 Product_list.jsp에서 useBean으로 사용된 ShopBean을 다시 세션으로부터 가져와서 재 사용하면 ShopBean에 있는 p_list를 채워진
상태에서 재 사용이 가능하다. 잃게 하기 위해서는 반드시 product_list.jsp에서 ShopBean을 useBean으로 정의하는 내용을 아래와 같이
복사해서 붙여 넣기하여 사용해야 한다.
--%>
<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
<table class="table">
  <thead>
  <tr>
    <td colspan="6">:: 장바구니 내용</td>
  </tr>
  <tr bgcolor="#dedede">
    <th>제품번호</th>
    <th width="25%">제품명</th>
    <th>단가</th>
    <th>수량</th>
    <th>금액</th>
    <th>삭제</th>
  </tr>
  </thead>

  <tbody>
  <jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>
  <%
    //장바구니에 저장된 모든 제품들을 배열로 가져온다.
    ProductVO[] ar = cart.getList();
    int total = 0;//총액

    if (ar != null){

      for (ProductVO vo : ar){


  %>
  <tr align="center">
    <td><%=vo.getP_num()%></td>
    <td><%=vo.getP_name()%></td>
    <td>
      정가:<%=vo.getP_price()%>원<br>
      <font color="red">
        세일가격: <%=vo.getP_saleprice()%>원
      </font>
    </td>
    <td>
      <!-- 수량 조정 폼 -->
      <form action="changeCount.jsp" method="post">
        <input type="hidden" name="p_name" value="<%=vo.getP_num()%>">
        <input type="number" name="count" value="<%=vo.getQuant()%>" min="1"/>
        <button type="button" onclick="ch(this.form)">
          변경</button>
      </form>
      <!------------------>
    </td>
    <td><%=vo.getTotalPrice()%>원</td>
    <td>
      <input type="button" value="삭제"
             style="border:1px solid black; cursor:pointer"
             onclick="javascript:location.href='delProduct.jsp?p_num=<%=vo.getP_num()%>'">
    </td>
  </tr>
  <%
      total += vo.getTotalPrice();
      }//for의 끝

    }else {
  %>
  <tr align="center">
    <td colspan="6">
      <b>장바구니가 비었습니다.</b>
    </td>
  </tr>
  <%
    }//if문의 끝
  %>
  <tr>
    <td colspan="5" align="right">총 결제액 :</td>
    <td><%=total%>원</td>
  </tr>

  </tbody>
</table>
</article>
</div>
<script>
  function ch(frm){
    frm.submit();
  }
</script>
</body>
</html>
