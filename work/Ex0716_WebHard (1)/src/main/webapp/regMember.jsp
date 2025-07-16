<%@ page import="mybatis.vo.MemVO" %>
<%@ page import="mybatis.dao.MemberDAO" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    // 배열을 인자로 받아서 하나의 문자열로 변환하는 함수
    public String makeString(String[] ar, String delim){
        StringBuffer sb = new StringBuffer();
        int i=0;
        for(String str : ar){
            sb.append(str);

            //구분자는 배열 마지막에는 추가하지 않아야 한다.
            if(i < ar.length-1)
                sb.append(delim);
            i++;
        }
        return sb.toString();
    }
%>
<%
    // 요청시 한글처리
    request.setCharacterEncoding("utf-8");

    //전달해오는 파라미터들 받기
    String u_id = request.getParameter("u_id");
    String u_pw = request.getParameter("u_pw");
    String u_name = request.getParameter("u_name");
    String[] u_phone = request.getParameterValues("u_phone");
    String phone = makeString(u_phone, "-"); // 010-1234-5678

    //Mapper를 호출하기 전에 Mapper로 전달할 파라미터 객체를 준비한다.
    MemVO mvo = new MemVO();
    mvo.setM_id(u_id);
    mvo.setM_pw(u_pw);
    mvo.setM_name(u_name);
    mvo.setM_phone(phone);

    // DAO의 함수를 호출하여 DB에 저장되도록 한다.
    int cnt = MemberDAO.registry(mvo);
    if(cnt > 0){
        // 회원가입에 성공한 경우!!!!!!!!
        // 현재 프로제트(application)의 members라는 폴더의
        // 정확한 절대경로를 확인하자!
        String path = application.getRealPath("/members/"+mvo.getM_id());
        //out.println(path);

        // 위 절대경로를 가지고 File객체를 생성한 후 디렉토리(폴더)를 생성하자!
        File f = new File(path);
        if(!f.exists())
            f.mkdirs();

        response.sendRedirect("index.jsp");
    }
%>

