package emp.action;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String viewPath = "jsp/add.jsp";

        //요청방식 구하기
        String method = request.getMethod();
        if(method.equalsIgnoreCase("post")){
            // 폼에서 현재 객체로 온 경우
            // viewPath를 null로 지정
            String empno = request.getParameter("empno");
            String ename = request.getParameter("ename");
            String job = request.getParameter("job");
            EmpVO vo = new EmpVO();
            vo.setEmpno(empno);
            vo.setEname(ename);
            vo.setJob(job);

            EmpDAO.add(vo);//DB에 저장!!!!!!!!!!

            viewPath = null;
        }

        return viewPath;
    }
}
