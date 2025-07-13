package com.example.ex_0709;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet ("/MyServlet5") // 1. URL 매핑 - http://서버주소/MyServlet5 라는 주소로 요청을 보내면 이 서블릿이 실행되도록 연결
public class MyServlet5 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //3. 요청시 한글처리(client -> server)
        request.setCharacterEncoding("utf-8");

        //응답시 한글처리(server -> 브라우저 응답)
        response.setContentType("text/html; charset=utf-8"); //"text/html"은 mimetype으로 표현

        //4. 요청시 파라미터들 받기
        String mId = request.getParameter("m_id"); //아이디 요소의 값 하나를 가져오기
        String mName = request.getParameter("m_name"); //이름 요소의 값 하나를 가져오기
        String[] mPhone = request.getParameterValues("m_phone"); //모든값들을 문자열로 가져온다.(전화번호)
        String[] mHobby = request.getParameterValues("m_hobby"); //체크박스들 중에서 체크된것의 값을 가져온다.

        //5. 응답을 위해 스트림생성
        PrintWriter out = response.getWriter(); //브라우저로 html을 보낼 통로 생성
        //응답 시작
        out.println("<h2>받은 값</h2>");
        out.println("<p>아이디:"+mId+"</p>");
        out.println("<p>이름:"+mName+"</p>");
        out.println("<p>연락처:</p>");
        for(int i=0; i<mPhone.length; i++){
            out.println(mPhone[i]);
            if(i < mPhone.length-1) // i가 2보다 작으면 "-"출력한다.
                out.println("-");   // 010-1234-5678
        }
        out.println("</p>");
        if(mHobby != null) {
            out.println("<p>취미:");
            for (int i = 0; i < mHobby.length; i++) {
                out.println(mHobby[i]);
                if (i < mHobby.length - 1) // i가 2보다 작으면 "-"출력한다.
                    out.println(",");   // 마지막에는 ","를 출력하지 않는다.
            }
            out.println("</p>");
        }
        out.close(); //6. 스트림 닫기
    }

    @Override // 2. 클라이언트에서 요청방식을 post로 보내면 해당 함수가 호출된다.
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); //POST 요청이 와도 GET방식으로 동일하게 처리한다.(즉, doGet 함수에서 처리한다)
    }
}
