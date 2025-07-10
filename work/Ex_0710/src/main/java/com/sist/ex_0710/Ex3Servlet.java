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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet ("/Ex3")
public class Ex3Servlet extends HttpServlet {
    SqlSessionFactory factory;

    @Override
    public void init(ServletConfig config) throws ServletException {
        try{
            Reader r = Resources.getResourceAsReader("mybatis/config/conf.xml");
            factory = new SqlSessionFactoryBuilder().build(r);
            r.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //요청시 한글처리
        request.setCharacterEncoding("UTF-8");

        //응답시 한글처리
        response.setContentType("text/html; charset=UTF-8");

        //파라미터들 받기
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        //emp.search라는 sql문을 호출하기 위해 파라미터들을 Map구조에 담아야 한다.
        Map<String, String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);

        //emp.search라는 sql문을 호출하기 위해 SqlSession을 얻어낸다.
        SqlSession ss = factory.openSession();
        List<EmpVO> list = ss.selectList("emp.search", map);

        //------------------------- 여기까지가 중요한거임 ----------------------

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
        ss.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
