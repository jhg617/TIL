package com.sist.ex_0710_pm;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/Ex3")
public class Ex3Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //요청시 한글처리
        request.setCharacterEncoding("UTF-8");
        //응답시 한글처리
        response.setContentType("text/html; charset=UTF-8");

        //파라미터들 받기
        String type = request.getParameter("searchType");
        String value = request.getParameter("searchValue");

        EmpVO[] list = EmpDAO.search(type, value);

        StringBuffer sb = new StringBuffer("<ol>");
        for(EmpVO vo : list){
            sb.append("<li>");
            sb.append(vo.getEmpno()); //사번
            sb.append(",");
            sb.append(vo.getEname()); //이름
            sb.append(",");
            sb.append(vo.getJob()); //직종
            sb.append(",");
            sb.append(vo.getDeptno()); //부서코드
            sb.append("</li>");
        }//for의 끝

        sb.append("</ol>");

        //응답을 위한 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<h2>검색 결과</h2>");
        out.println("<hr/>");
        out.println(sb.toString());
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
