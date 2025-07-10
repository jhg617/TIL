package com.sist.ex_0710;
import mybatis.vo.EmpVO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

@WebServlet ("/Ex2")
public class Ex2Servlet extends HttpServlet {
    SqlSessionFactory factory;

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            //Mybatis준비
            Reader r = Resources.getResourceAsReader("mybatis/config/conf.xml");
            factory = new SqlSessionFactoryBuilder().build(r);
            r.close();
            //------------------------------- 한번만 수행됨 ----------------------------------
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //MyBatis를 활용하여 emp테이블의 자원들을 표현하려고 한다.
        //응답시 한글처리
        response.setContentType("text/html; charset=UTF-8");

        //파라미터 값 받기
        String empno = request.getParameter("empno_tx");

        // SQL문을 호출하기 위해 SqlSession을 얻어낸다.
        SqlSession ss = factory.openSession();
        EmpVO vo = ss.selectOne("emp.get_emp", empno);
        StringBuffer sb = new StringBuffer();

        if (vo == null) {
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
        ss.close();
        }//for의 끝


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
