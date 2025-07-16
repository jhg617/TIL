<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //요청시 한글처리
    request.setCharacterEncoding("utf-8");

    //파라미터들 받기
    String cPath = request.getParameter("cPath");
    String f_name = request.getParameter("f_name");

    //받은 파라미터들과 함께 절대경로가 필요하다.
    String realPath = application.getRealPath("/members/"+cPath+"/"+f_name);

    //절대경로를 가지고 File객체 생성
    File f = new File(realPath);

    //존재여부 확인
    if(!f.exists()){
        f.mkdirs();//폴더생성
        response.sendRedirect("myDisk.jsp?cPath="+cPath);
    }else{
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <button type="button" onclick="goBack()">돌아가기</button>

    <script>
        alert("폴더가 이미 존재합니다.");

        function goBack(){
            location.href="myDisk.jsp?cPath=<%=cPath%>";
        }

    </script>
</body>
</html>
<%
    }
%>