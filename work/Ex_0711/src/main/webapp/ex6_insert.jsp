<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <article>
        <header>
            <h2>사원추가</h2>
        </header>
        <div>
            <form action="ex6_add.jsp" method="post">
                <label for="empno_tx">사번:</label>
                <input type="text" id="empno_tx" name="empno"/><br/>
                <label for="ename_tx">이름:</label>
                <input type="text" id="ename_tx" name="ename"/><br/>
                <label for="job_tx">직종:</label>
                <input type="text" id="job_tx" name="job"/><br/>
                <label for="hdate_tx">입사일:</label>
                <input type="text" id="hdate_tx" name="hdate"/><br/>
                <button type="button" onclick="exe()">보내기</button>
            </form>
        </div>
    </article>
<script>
    function exe() {
        let no = document.getElementById("empno_tx");
        if(no.value.trim().length == 0){
            alert("사번을 입력하세요");
            no.value = "";
            no.focus();
            return;
        }
        document.forms[0].submit();
    }
</script>
</body>
</html>
