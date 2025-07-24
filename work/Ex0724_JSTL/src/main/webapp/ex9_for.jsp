<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
      table{ /*테이블 만나면 아래와 같이 지정*/
        width: 600px;
        border-collapse: collapse;
      }
      table th, table td{
        border: 1px solid #000;
        padding: 5px;
      }
      table caption{
        text-indent: -9999px;
        height: 0;
      }
    </style>
</head>
<body>
  <header>
  <h1>회원목록</h1>
  </header>
  <article>
    <table>
      <caption>회원목록테이블</caption>
      <thead>
        <tr>
          <th>번호</th>
          <th>이름</th>
          <th>전화번호</th>
          <th>이메일</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="vo" items="${requestScope.list}" varStatus="vs"> <%--여기서 varStatus는 for문에서의 i 역할--%>
        <tr>
          <td>${vs.index+1}</td> <%--인덱스이므로 1이 추가되서 나와야한다.--%>
          <td>${vo.name}</td> <%--vo.getName()--%>
          <td>${vo.phone}</td>
          <td>${vo.email}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </article>
</body>
</html>
