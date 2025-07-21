package emp.action;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TotalAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 사원목록을 얻어낸다.
        EmpVO[] ar = EmpDAO.getAll();

        //jsp에서 표현하기 위해 request에 저장한다.
        request.setAttribute("ar", ar);

        return "jsp/total.jsp";
    }
}
