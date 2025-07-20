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
        // 1. 파라미터 받기
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        // 2. 파라미터를 Map에 저장해서 DAO로 전달하기
        Map<String, String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);

        // 3. DAO의 search 메서드를 호출하여 결과 받기
        EmpVO[] ar = EmpDAO.search(map);

        // 4. request에 결과(사원 배열) 전달
        request.setAttribute("ar", ar);

        // 5. 결과를 보여줄 JSP 경로 반환
        return "jsp/search.jsp";
    }
}
