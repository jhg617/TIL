package com.example.ex_0709;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet ("/MyServlet4")
public class MyServlet4 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //요청시 한글처리!
        request.setCharacterEncoding("utf-8");

        //파라미터 받기
        String[] phones = request.getParameterValues("m_phone");
        String[] chk = request.getParameterValues("chk");
        String names = request.getParameter("m_name");
        String id = request.getParameter("m_id");

        //응답을 위한 한글처리!
        response.setContentType("text/html;charset=utf-8");
        //스트림 생성
        PrintWriter out = response.getWriter();
        //응답 시작
        out.println("넘어온 값:"+"<br/>");
        out.println(id+"<br/>");
        out.println(names+"<br/>");
        for(int i=0; i<phones.length; i++)
            out.println(phones[i]);

        for(int i=0; i<chk.length; i++)
            out.println("<chk>"+chk[i]+"</chk>");
        out.println("</ul>");
        out.close(); //스트림 닫기
    }
}
