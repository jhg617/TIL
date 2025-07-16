<%@ page import="mybatis.vo.ProductVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

%>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<div id="wrap">
  <header>
    <jsp:include page="./menu.jsp"/>
  </header>

<article>
  <jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/> <%--브라우저를 닫기 전까지는 살아있는다.--%>
  <jsp:setProperty name="sb" property="*"/>
  <%-- 위는 sb.setCategory(request.getParameter("category"))--%>
  <%--요청한곳으로부터 파라미터값을 가져와서 shopBean의 카테고리에 저장한다.--%>
  <%
    sb.searchProduct(); // ShopBean이 가지고 있는 멤버변수인 p_list라는 배열이 채워진다.

    // ShopBean이 가지고 있는 p_list라는 배열을 얻어낸다.
    ProductVO[] ar = sb.getP_list();
  %>
  <table class="table">
    <tr>
      <th>제품번호</th>
      <th>이미지</th>
      <th>제품명</th>
      <th>제품가격</th>
      <th>비고</th>
    </tr>
<%
  if(ar != null){ //배열에 어떤값이라도 들어왔을 경우
    for(ProductVO pvo : ar){ //ar에 저장된 제품정보를 하나씩 꺼내서 pvo에 저장(제품정보를 담는 변수)
%>
    <tr align="center">
      <td><%=pvo.getP_num()%></td> <%--제품명--%>
      <td><img src="images/<%=pvo.getP_image_s()%>" width="100" height="95"></td>
      <td>
        <a href="product_content.jsp?prod_num=<%=pvo.getP_num()%>"> <%--제품번호--%>
          <%=pvo.getP_name()%> <%--제품이름이며, 클릭 시 해당 제품의 번호(prod_num)를 함께 전달하여 상세페이지로 이동시킴--%>
        </a>
      </td>
      <td>
        할인가 : <%=pvo.getP_saleprice()%>원<br> <%--할인금액 가져온다.--%>
        <font color="red">(<%=pvo.getPercent()%>%)</font> <%--할인율 가져온다.--%>
      </td>
      <td>
        시중 가격 : <%=pvo.getP_price()%>원 <%--가격 가져오기--%>
      </td>
    </tr>
<%
    } //for의 끝
  }else{ //
%>
    <tr>
      <td colspan="5" class="txt_C">
        검색된 제품이 없습니다.
      </td>
    </tr>
<%
    }
  //if의 끝
%>
  </table>











</article>
</div>
</body>
</html>