package com.example.ex_0709;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet ("/MyServlet5")
public class MyServlet5 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //요청시 한글처리
        request.setCharacterEncoding("utf-8");

        //응답시 한글처리
        response.setContentType("text/html; charset=utf-8"); //"text/html"은 mimetype으로 표현

        //요청시 파라미터들 받기
        String mId = request.getParameter("m_id");
        String mName = request.getParameter("m_name");
        String[] mPhone = request.getParameterValues("m_phone");
        String[] mHobby = request.getParameterValues("m_hobby");

        //응답을 위해 스트림생성
        PrintWriter out = response.getWriter();
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
            for (int i = 0; i < mPhone.length; i++) {
                out.println(mHobby[i]);
                if (i < mHobby.length - 1) // i가 2보다 작으면 "-"출력한다.
                    out.println(",");   // 마지막에는 ","를 출력하지 않는다.
            }
            out.println("</p>");
        }
        out.close(); //스트림 닫기
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
