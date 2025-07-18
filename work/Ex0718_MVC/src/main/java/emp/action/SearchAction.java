package emp.action;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        Map<String, String> ar = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);

        List<EmpVO> list = EmpDAO.search(ar);

        request.setAttribute("list", list);

        /*EmpVO[] ar = EmpDAO.getAll();

        request.setAttribute("ar", ar);
        System.out.println(ar.length+"::::::::");*/

        return "jsp/search.jsp";
    }
}
