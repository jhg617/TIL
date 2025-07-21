package emp.action;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAction2 implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 파라미터 받기
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        EmpVO[] ar = EmpDAO.search(searchType, searchValue);
        request.setAttribute("ar", ar);

        return "jsp/search2.jsp";
    }
}
