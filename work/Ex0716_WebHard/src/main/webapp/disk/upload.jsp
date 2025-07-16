<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    첨부파일이 있는 폼은 enctype을 멀티파트로 지정해야 한다. 그렇게 되면
    절대로 request를 통해 파라미터를 받을 수 없다.
    무조건 multpartRequest를 통해 받아야 하고 이걸 쓰려면 라이브러리가 필요함.
    mvm레파지토리 사이트에서 cos로 검색한 후 원하는 버전을 클릭한다.
    그리고 폼에 추가
--%>
<%
    // 전달되는 폼의 enctype이 멀티파트/폼 데이터로 지정됐다면
    // 절대로 request를 통해 파라미터들을 받을 수 없어서 세션에 파일을 저장할 경로(dir)에 저장하여 넘어왔다.
    String dir = (String)session.getAttribute("dir") ;

    // 파일을 저장할 위치값을 절대경로로 준비해야 한다.
    String realPath = application.getRealPath("/members/"+dir);

    MultipartRequest mr = new MultipartRequest(request, realPath,
            1024*1024*5, new DefaultFileRenamePolicy());

    // 폼에 있는 자원들을 받을 수 있다.
    String path = mr.getParameter("cPath");

    // 첨부된 파일의 정보
    File f = mr.getFile("upload");

    // 파일의 이름이 변경될 수 있으므로 원래 이름을 알아낸다.
    String ori_name = mr.getOriginalFileName("upload");

    // 파일의 현재 이름
    String f_name = f.getName();

//    response.sendRedirect("myDisk.jsp?cPath="+dir);
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
