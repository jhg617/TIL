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
import java.util.List;

@WebServlet ("/Ex1")
public class Ex1Servlet extends HttpServlet {
    SqlSessionFactory factory; //*************

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
        response.setContentType("text/html;charset=UTF-8");

        // SQL문을 활용하기 위해 SqlSession을 얻어낸다.
        SqlSession ss = factory.openSession();

        List<EmpVO> list = ss.selectList("emp.all");

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
        out.println("<h2>전체사원 목록</h2>");
        out.println("<hr/>");
        out.println(sb.toString());
        out.close();
        ss.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
