package emp.action;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AllAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        EmpVO[] ar = EmpDAO.getAll();

        request.setAttribute("ar",ar); //여기에 반드시 저장해야 한다!!!!
        System.out.println(ar.length+":::::::::::");
        return "jsp/all.jsp";
    }
}
