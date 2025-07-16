<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    첨부파일이 있는 폼은 enctype을 multipart로 지정해야 한다. 그렇게되면
    절대로 request를 통해 파라미터를 받을 수 없다. 해결은
    무조건 MultipartRequest객체를 통해 받아야 한다. 라이브러리가 필요함
    mvnrepository사이트에서 cos로 검색한 후
    com.servlets>>cos를 선택하여 원하는 버전을 클릭한다.
    그리고 dependency를 복사해서 pom.xml에 추가한다. + 동기화
--%>
<%
    // 전달되는 폼의 enctype이 multipart/form-data로 지정됐다면 절대로
    // request를통해 파라미터들을 받을 수 없어서 session에 파일을 저장할 경로(dir)
    // 저장하여 넘어왔다.
    String dir = (String)session.getAttribute("dir");

    //파일을 저장할 위치값을 절대경로로 준비해야 한다.
    String realPath = application.getRealPath("/members/"+dir);

    MultipartRequest mr = new MultipartRequest(request,realPath,
            1024*1024*5, new DefaultFileRenamePolicy());
    // 여기까지만 해도 전달되는 첨부파일이 realPath경로에 저장된다.

    // 폼에 있는 자원들을 받을 수 있다.
    String path = mr.getParameter("cPath"); //지금은 의미가 없음

    // 첨부된 파일의 정보
    File f = mr.getFile("upload");

    // 파일의 이름이 변경될 수 있으므로 원래 이름을 알아낼 수 있다.
    String ori_name = mr.getOriginalFileName("upload");

    // 파일의 현재이름
    String f_name = f.getName();

    //response.sendRedirect("myDisk.jsp?cPath="+dir);
%>
<html>
<head>
    <title>Title</title>
</head>
<body onload="movePage()">
    <form action="myDisk.jsp" method="post">
        <input type="hidden" name="cPath" value="<%=dir%>"/>
    </form>
<script>
    function movePage() {
        document.forms[0].submit();
    }
</script>
</body>
</html>
