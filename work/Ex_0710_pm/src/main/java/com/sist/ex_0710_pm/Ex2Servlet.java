package com.sist.ex_0710_pm;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Ex2")
public class Ex2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //요청,응답 시 한글처리
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        //파라미터 값 받기
        String empno = request.getParameter("empno_tx");
        EmpVO vo = EmpDAO.getEmp(empno);

        StringBuffer sb = new StringBuffer();

        if (vo != null) {
            sb.append("<p>");
            sb.append(vo.getEmpno());
            sb.append(",");
            sb.append(vo.getEname());
            sb.append(",");
            sb.append(vo.getJob());
            sb.append(",");
            sb.append(vo.getDeptno());
            sb.append("</p>");
        }
        PrintWriter out = response.getWriter();
        out.println("<h2>검색 결과</h2>");
        out.println(sb.toString());
        out.close();
    }//for의 끝

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
