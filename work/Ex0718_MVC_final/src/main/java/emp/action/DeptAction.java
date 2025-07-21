package emp.action;

import mybatis.dao.DeptDAO;
import mybatis.vo.DeptVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 파라미터가 있다면 받으면 된다.
        DeptVO[] ar = DeptDAO.getAll();

        if(ar != null)
            request.setAttribute("ar", ar);

        return "jsp/dept.jsp";
    }
}
