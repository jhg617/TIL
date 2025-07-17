<%@ page import="mybatis.vo.ProductVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
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
        <jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
        <jsp:setProperty name="sb" property="p_num" param="prod_num"/>
<%
    //위에서 파라미터로 넘어오는 제품번호를 ShopBean의 p_num에 저장시킨 상태다.
    //여기서 ShopBean의 기능 중 특정 제품을 검색하는 함수가 있다.
    ProductVO pvo = sb.getProduct();
%>
        <table class="table">
            <colgroup>
                <col width="40%">
                <col width="60%">
            </colgroup>
            <tbody>
            <tr>
                <td>제품Category</td>
                <td><%=pvo.getCategory()%></td>
            </tr>
            <tr>
                <td>제품번호</td>
                <td><%=pvo.getP_num()%></td>
            </tr>
            <tr>
                <td>제품이름</td>
                <td><%=pvo.getP_name()%></td>
            </tr>
            <tr>
                <td>제품 판매사</td>
                <td><%=pvo.getP_company()%></td>
            </tr>
            <tr>
                <td>제품가격</td>
                <td>(할인가 : <%=pvo.getP_saleprice()%>원 )</td>
            </tr>
            <tr>
                <td colspan="2">제품설명</td>
            </tr>
            <tr>
                <td colspan="2" align="center"><img src ="images/<%=pvo.getP_image_l()%>"></td>
            </tr>
            <tr>
                <td colspan="2"><%=pvo.getP_content()%></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="장바구니에 담기"
                           onclick="javascript:location.href='addProduct.jsp?p_num=<%=pvo.getP_num()%>'"/>
                    <input type="button" value="장바구니 보기"
                           onclick="javascript:location.href='cartList.jsp'"/>
                </td>
            </tr>
            </tbody>
        </table>

    </article>
</div>
</body>
</html>
