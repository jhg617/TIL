<%--
//TODO: JSTL을 사용하기 위해서는 아래 매뉴얼 참고!
******** Eclipse ********
apache.org로 접속 후 Apache Project List항목에서 [Tomcat]을 선택함
    왼쪽 메뉴에서 [Taglibs]선택!
    그리고 [Download]를 선택한 후 화면 위쪽에 있는
    [Apache Standard Taglib]링크를 선택!
    [Standard1.1]항목의 우측에 있는 [download]를 선택!
    [binaries/]링크를 선택한 후 아래쪽에서 6번째인
    [jakarta-taglibs-standard-1.1.2.zip]파일 다운로드 후 압축해제!
    lib폴더에 있는 2개의 jar파일을 원하는 프로젝트/.../WEB-INF/lib에 붙여넣기 한다.

******** intelliJ *******
    intelliJ는 MVNRepository.com/에 접속하여 jstl로 검색한 후 javax.servlet » jstl그룹으로 된
    항목을 클릭! - 1.2버전을 선택! dependency를 복사하여 pom.xml에 추가!

JSTL : JSP Standard Tag Library
- JSP에서 제어문(반복문과 조건문, 데이터 포멧,...)을 구현하는 커스텀 태그 라이브러리다.
- JSTL은 EL(Expression Language)표현언어를 기반으로 사용한다.

  JSTL : JSP Standard Tag Library
      - JSP에서 제어문(반복문과, 조건문, 데이터포맷, ...)을
          구현하는 커스텀 태그 라이브러리다.
          JSTL은 EL(Expression Language) 표현언어를 기반으로 사용한다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("s1", "대한민국");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="ex1_1.jsp" method="post">
        <input type="hidden" name="v1" value="100000"/>
        <input type="text" name="u_name"/><br/>
        <button type="button" onclick="exe(this.form)">보내기</button>
    </form>
<script>
    function exe(frm) {
      //유효성검사 생략
      frm.submit();
    }
</script>
</body>
</html>
