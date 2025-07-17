package ex3;

import mybatis.dao.DeptDAO;
import mybatis.vo.DeptVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptAction implements Action {
    //오버라이딩(메서드 재정의)
    @Override
    public String execute(HttpServletRequest request,
                          HttpServletResponse response){
        //부서목록 가져오기 request에 저장하는 것이 목적이다.
        DeptVO[] ar = DeptDAO.getAll();

        //얻어낸 부서목록을 request에 ar에 저장!
        request.setAttribute("dept", ar);

        //도착할 경로를 forward!
        return "ex3/dept.jsp";
    }
}
